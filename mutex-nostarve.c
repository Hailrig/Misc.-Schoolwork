#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <sys/types.h>
#include <sys/syscall.h>
#include <sys/queue.h>
#include "common_threads.h"

//
// Here, you have to write (almost) ALL the code. Oh no!
// How can you show that a thread does not starve
// when attempting to acquire this mutex you build? <- the threads are ran in a first in first out order, cycling between them evenly so nobody starves
//

typedef struct node{
	int id;
	struct node *next;
} node;

typedef struct queue{
	node *head;
	node *tail;
} queue;

void init_queue(queue *myQueue){
	myQueue->head = NULL;
	myQueue->tail = NULL;
}

void enqueue(queue *myQueue, int id){
	node * newnode = malloc(sizeof(node));
	newnode->id = id;
	newnode->next = NULL;
	if (myQueue->tail != NULL){
		myQueue->tail->next = newnode;
	}
	myQueue->tail = newnode;
	if (myQueue->head == NULL){
		myQueue->head = newnode;
	}
}

void dequeue(queue *myQueue){
	myQueue->head = myQueue->head->next;
	if (myQueue->head == NULL){
		myQueue->tail = NULL;
	}
}

int peek(queue *myQueue){
	return myQueue->head->id;
}

typedef struct __ns_mutex_t {
	sem_t semtex;
	queue q;
} ns_mutex_t;

void ns_mutex_init(ns_mutex_t *m) {
	sem_init(&m->semtex, 0, 1);
	init_queue(&m->q);
}

void ns_mutex_acquire(ns_mutex_t *m) {
	pid_t x = syscall(__NR_gettid);
	enqueue(&m->q, x);
	sem_wait(&m->semtex);
	while (x != peek(&m->q)){
		sem_post(&m->semtex);
		sleep(1);
		sem_wait(&m->semtex);
	}
	dequeue(&m->q);
}

void ns_mutex_release(ns_mutex_t *m) {
	sem_post(&m->semtex);
}


ns_mutex_t mutex;
pthread_t	p1, p2, p3, p4, p5;

void *worker(void *arg) {
	time_t newtime;
	time_t oldtime;
	for (int i = 0; i < 5; i++){
		oldtime = time(0);
		ns_mutex_acquire(&mutex);
		sleep(.5);
		pid_t x = syscall(__NR_gettid);
		printf("ID is: %d \n", x);
		ns_mutex_release(&mutex);
		newtime = time(0);
		printf("Time between request and finish: %ld \n", newtime-oldtime);
	}
    return NULL;
}

int main(int argc, char *argv[]) {
    ns_mutex_init(&mutex);
    printf("parent: begin\n");
    Pthread_create(&p1, NULL, worker, NULL);
    Pthread_create(&p2, NULL, worker, NULL);
    Pthread_create(&p3, NULL, worker, NULL);
    Pthread_create(&p4, NULL, worker, NULL);
    Pthread_create(&p5, NULL, worker, NULL);
    Pthread_join(p1, NULL);
    Pthread_join(p2, NULL);
    Pthread_join(p3, NULL);
    Pthread_join(p4, NULL);
    Pthread_join(p5, NULL);
    printf("parent: end\n");
    return 0;
}

