#include <pthread.h>
#include <stdio.h>
#include <time.h>

typedef struct __counter_t {
int value;
pthread_mutex_t lock;
} counter_t;

void init(counter_t *c) {
c->value = 0;
pthread_mutex_init(&c->lock, NULL);
}

void increment(counter_t *c) {
pthread_mutex_lock(&c->lock);
c->value++;
pthread_mutex_unlock(&c->lock);
}

void decrement(counter_t *c) {
pthread_mutex_lock(&c->lock);
c->value--;
pthread_mutex_unlock(&c->lock);
}

int get(counter_t *c) {
pthread_mutex_lock(&c->lock);
int rc = c->value;
pthread_mutex_unlock(&c->lock);
return rc;
}

void* counter(void* countptr){
	struct __counter_t* count = countptr;
	for(int i = 0; i < 100000000; i++){
		increment(count);
	}
	return (0);
}

int main(){
	struct __counter_t count;
	pthread_t id1;
	pthread_t id2;
	pthread_t id3;
	pthread_t id4;
	int *answer;
	
	printf("Time is: %ld \n", time(NULL));
	init(&count);
	pthread_create(&id1, NULL, counter, &count);
	pthread_join(id1, (void**)&answer);
	printf("Time is: %ld \n", time(NULL));
	
	init(&count);
	pthread_create(&id1, NULL, counter, &count);
	pthread_create(&id2, NULL, counter, &count);
	pthread_join(id1, (void**)&answer);
	pthread_join(id2, (void**)&answer);
	printf("Time is: %ld \n", time(NULL));
	
	init(&count);
	pthread_create(&id1, NULL, counter, &count);
	pthread_create(&id2, NULL, counter, &count);
	pthread_create(&id3, NULL, counter, &count);
	pthread_join(id1, (void**)&answer);
	pthread_join(id2, (void**)&answer);
	pthread_join(id3, (void**)&answer);
	printf("Time is: %ld \n", time(NULL));
	
	init(&count);
	pthread_create(&id1, NULL, counter, &count);
	pthread_create(&id2, NULL, counter, &count);
	pthread_create(&id3, NULL, counter, &count);
	pthread_create(&id4, NULL, counter, &count);
	pthread_join(id1, (void**)&answer);
	pthread_join(id2, (void**)&answer);
	pthread_join(id3, (void**)&answer);
	pthread_join(id4, (void**)&answer);
	printf("Time is: %ld \n", time(NULL));
	
	
	return (0);
}

















