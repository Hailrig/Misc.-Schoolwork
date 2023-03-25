#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "common_threads.h"

//
// this is essentially just the code from the notes, so I'm adding comments to communicate I understand what the code does
//

typedef struct __rwlock_t {
	sem_t readLock;	//outer lock to control the readers value
	sem_t writeLock;	//lock to the reasource
	int readers;
} rwlock_t;


void rwlock_init(rwlock_t *rw) {
	rw-> readers = 0;
	sem_init(&rw->readLock, 0, 1);
	sem_init(&rw->writeLock, 0, 1);
}

void rwlock_acquire_readlock(rwlock_t *rw) {
	sem_wait(&rw->readLock); //get the outer lock to be able to change the readers value safely
	rw->readers++;
	if (rw->readers == 1){ //if you're the first reader
		sem_wait(&rw->writeLock); //get the writelock to keep the other writers out. if you're the first reader and there are writers currently writing, will add you to the writelock semaphore for when they're done
	}
	sem_post(&rw->readLock); //release the lock for readers
}

void rwlock_release_readlock(rwlock_t *rw) {
	sem_wait(&rw->readLock); //get the lock to change readers
	rw->readers--;	//lower the readers count
	if (rw->readers == 0){
		sem_post(&rw->writeLock); //if you're the last, free up the reasource to let writers write
	}
	sem_post(&rw->readLock); //free up access to the readers count
}

void rwlock_acquire_writelock(rwlock_t *rw) {
	sem_wait(&rw->writeLock); //add yourself to the writers semaphore to say you want to write
}

void rwlock_release_writelock(rwlock_t *rw) {
	sem_post(&rw->writeLock); //remove yourself after you're done writing
}

//
// Don't change the code below (just use it!)
// 

int loops;
int value = 0;

rwlock_t lock;

void *reader(void *arg) {
    int i;
    for (i = 0; i < loops; i++) {
	rwlock_acquire_readlock(&lock);
	printf("read %d\n", value);
	sleep(1);
	rwlock_release_readlock(&lock);
    }
    return NULL;
}

void *writer(void *arg) {
    int i;
    for (i = 0; i < loops; i++) {
	rwlock_acquire_writelock(&lock);
	value++;
	printf("write %d\n", value);
	rwlock_release_writelock(&lock);
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    assert(argc == 4);
    int num_readers = atoi(argv[1]);
    int num_writers = atoi(argv[2]);
    loops = atoi(argv[3]);

    pthread_t pr[num_readers], pw[num_writers];

    rwlock_init(&lock);

    printf("begin\n");

    int i;
    for (i = 0; i < num_readers; i++)
	Pthread_create(&pr[i], NULL, reader, NULL);
    for (i = 0; i < num_writers; i++)
	Pthread_create(&pw[i], NULL, writer, NULL);

    for (i = 0; i < num_readers; i++)
	Pthread_join(pr[i], NULL);
    for (i = 0; i < num_writers; i++)
	Pthread_join(pw[i], NULL);

    printf("end: value %d\n", value);

    return 0;
}

