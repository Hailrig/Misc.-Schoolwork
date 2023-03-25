#include <stdio.h>	/* include needed libraries */
#define MAXROW 50	/*set maximum sizes for image 2D array */
#define MAXCOL 50
#define	AP	'&'		/*char symbols used in array */
#define	PL	'+'


/* global variables*/
FILE *fpin1,*fpout1;	/*pointers to files*/

/*************************************************************/
/****** void PrImage(Image, Nrows,Ncols) ******/
/* This procedure prints a 2D char array row by row
	both to the screen and to an output file (global) */
void PrImage( char Image[MAXROW][MAXCOL], int Nrows, int Ncols)
{
	for(int x = 0; x < Nrows; x++){
		for(int j = 0; j < Ncols; j++){
			fprintf(stdout, "%c ", Image[x][j]);
			fprintf(fpout1, "%c ", Image[x][j]);
		}
		fprintf(stdout, "\n");
		fprintf(fpout1, "\n");
	}

}/*End of PrImage*/
/*************************************************************/
/****** void CopyCol(Mat1,Mat2,Nrows,Coli,Colj) ******/
/* Copy Coli of Mat1 to Colj of Mat2 of the same dimensions */
void CopyCol( char Mat1[MAXROW][MAXCOL], char Mat2[MAXROW][MAXCOL],
	int Nrows, int Coli, int Colj)
{
	for (int i = 0; i < Nrows; i++){
		Mat2[i][Colj] = Mat1[i][Coli];
	}


}/*End of CopyCol*/
/*************************************************************/
/****** void CopyRow(Mat1,Mat2,Ncols,Rowi,Rowj) ******/
/* Copy row i of Mat1 to row j of Mat2 of the same dimensions */
void CopyRow( char Mat1[MAXROW][MAXCOL], char Mat2[MAXROW][MAXCOL],
	int Ncols, int Rowi, int Rowj)
{

	for (int i = 0; i < Ncols; i++){
		Mat2[Rowj][i] = Mat1[Rowi][i];
	}

}/*End of CopyRow*/
/*************************************************************/
/****** void CopyColRow(Mat1,Mat2,Nrows,Coli,Rowj) ******/
/* Copy col i of Mat1 to row j of Mat2 */
void CopyColRow( char Mat1[MAXROW][MAXCOL], char Mat2[MAXROW][MAXCOL],
	int Nrows, int Ncols, int Coli, int Rowj)
{
	for (int i = Nrows; i > 0; i--){
		Mat2[Rowj][i] = Mat1[i][Coli];
	}

}/*End of CopyColRow*/
/*************************************************************/
/****** void CopyColrevRow(Mat1,Mat2,Nrows,Ncols,Coli,Rowj) ******/
/* Copy col i from (Nrows to 0) of Mat1 to row j of Mat2 from 0 to Ncols */
/* that is, copy the column, from bottom to top element,to the row */
/* 	copy column (Ncols-1) from (Nrows-1 element) to row (0) from (0) element
	copy column (Ncols-2) from (Nrows-1 element) to row (1) from (0) element
	copy column (0) from (Nrows-1 element) to row (Ncols-1) from (0) element*/
void CopyColrevRow( char Mat1[MAXROW][MAXCOL], char Mat2[MAXROW][MAXCOL],
	int Nrows, int Ncols, int Coli, int Rowj)
{

	for (int i = 0; i < Nrows; i++){
		Mat2[Rowj][Nrows-i-1] = Mat1[i][Coli];
	}
		
}/*End of CopyrevColRow*/
/*************************************************************/
/****** void CopyRotate(Mat1,Mat2,Nrows,Ncols,Coli,Rowj) ******/
/* Spin the values to the right*/
void CopyRotate( char Mat1[MAXROW][MAXCOL], char Mat2[MAXROW][MAXCOL],
	int Nrows, int Ncols, int Coli, int Rowj)
{

	for (int i = Nrows; i > 0; i--){
		Mat2[Rowj][Nrows-1-i] = Mat1[i][Coli];
	}
		
}/*End of CopyRotate*/
/*************************************************************/
/****** void VMirror(Image1, Image2, Nrows, Ncols) ******/
/* Given the 2D char array of Image1 and its dimensions,
	construct the vertical mirror image in Image 2 as in:
	copy columns (0,1,...,Ncols-1) of Image1 to
	columns (Ncols-1, Ncols-2, ..., 1, 0) respectively of Image2 */
void VMirror( char Image1[MAXROW][MAXCOL], char Image2[MAXROW][MAXCOL],
	int Nrows, int Ncols)
{
	fprintf(stdout, "\nTASK 1 = Vertical Mirroring\n");
	fprintf(fpout1, "\nTASK 1 = Vertical Mirroring \n");
	fprintf(stdout, "IMchr2 contains: \n");
	fprintf(fpout1, "IMchr2 contains: \n");
	
	for (int i = 0; i < Ncols; i++){
		CopyCol(Image1, Image2, Nrows, i, Ncols-i-1);
	}
	
	PrImage(Image2, Nrows, Ncols);

}/*End of VMirror*/
/*************************************************************/
/****** void HMirror(Image1, Image2, Nrows, Ncols) ******/
/* Given the 2D char array of Image1 and its dimensions,
	construct the horizontal mirror image in Image 2 as in:
		copy rows (0,1,...,Nrows-1) of Image1
		to rows (Nrows-1,Nrows-2,...,1,0) respectively of Image2 */
void HMirror( char Image1[MAXROW][MAXCOL], char Image2[MAXROW][MAXCOL],
	int Nrows, int Ncols)
{
	fprintf(stdout, "\nTASK 2 = Horizontal Mirroring\n");
	fprintf(fpout1, "\nTASK 2 = Horizontal Mirroring \n");
	fprintf(stdout, "IMchr2 contains: \n");
	fprintf(fpout1, "IMchr2 contains: \n");
	
	for (int i = 0; i < Nrows; i++){
		CopyRow(Image1, Image2, Ncols, i, Nrows-i-1);
	}
	
	PrImage(Image2, Nrows, Ncols);

}/*End of HMirror*/
/*************************************************************/
/****** void DiagR(Image1, Image2, Nrows, Ncols) ******/
/*Given the 2D char array of Image1 and its dimensions,
	construct the flipped image in Image2 along the top
	left to bottom right diagonal as in:
		 copy col 0 of Image1 -> row 0 of Image2
		 copy col 1 of Image1 -> row 1 of Image2
		......................................
		 copy col (Ncols-1) of Image1 to row (Ncols-1) of Image2
		 NOTE: sizes of Image2 are inverted from Image1 */
void DiagR( char Image1[MAXROW][MAXCOL], char Image2[MAXROW][MAXCOL],
	int Nrows, int Ncols)
{
	fprintf(stdout, "\nTASK 3 = Diagonal Right\n");
	fprintf(fpout1, "\nTASK 3 = Diagonal Right\n");
	fprintf(stdout, "IMchr2 contains: \n");
	fprintf(fpout1, "IMchr2 contains: \n");
	
	for (int i = 0; i < Ncols; i++){
		CopyColRow(Image1, Image2, Nrows, Ncols, i, i);
	}
	
	PrImage(Image2, Ncols, Nrows);


}/*End of DiagR*/
/*************************************************************/
/****** void DiagL(Image1, Image2, Nrows, Ncols) ******/
/*Given the 2D char array of Image1 and its dimensions,
	construct the flipped image in Image2 along the top
	right to bottom left diagonal as in:
		copy col (Ncols-1) of Image1 -> row 0 of Image2
		copy col (Ncols-2) of Image1 -> row 1 of Image2
		......................................
		copy col 0 of Image1 -> row (Ncols-1) of Image2
		NOTE: sizes of Image2 are inverted from Image1 */
void DiagL( char Image1[MAXROW][MAXCOL], char Image2[MAXROW][MAXCOL],
	int Nrows, int Ncols)
{
	fprintf(stdout, "\nTASK 4 = Diagonal Left\n");
	fprintf(fpout1, "\nTASK 4 = Diagonal Left\n");
	fprintf(stdout, "IMchr2 contains: \n");
	fprintf(fpout1, "IMchr2 contains: \n");
	
	for (int i = Ncols; i > 0; i--){
		CopyColrevRow(Image1, Image2, Nrows, Ncols, Ncols-1-i, i);
	}
	
	PrImage(Image2, Ncols, Nrows);


}/*End of DiagL*/
/*************************************************************/
/****** void RotR(Image1, Image2, Nrows, Ncols) ******/
/*Given the 2D char array of Image1 and its dimensions,
	construct the rotated by 90 degree image in Image2 */
void RotR( char Image1[MAXROW][MAXCOL], char Image2[MAXROW][MAXCOL],
	int Nrows, int Ncols)
{
	fprintf(stdout, "\nTASK 5 = Rotation Right\n");
	fprintf(fpout1, "\nTASK 5 = Rotation Right\n");
	fprintf(stdout, "IMchr2 contains: \n");
	fprintf(fpout1, "IMchr2 contains: \n");
	
	for (int i = 0; i < Ncols; i++){
		CopyRotate(Image1, Image2, Nrows, Ncols, i, i);
	}
	
	PrImage(Image2, Ncols, Nrows);


}/*End of RotR*/
/*************************************************************/
/****** void RdSize(*Nrows,*Ncols) ******/
/*Read from an input file two integers for the number of rows and
	number of columns of the image to be processed*/
void RdSize(int *Nrows, int *Ncols)
{
	fscanf(fpin1, "%i", Nrows);
	fscanf(fpin1, "%i", Ncols);

}/*End of RdSize*/
/*************************************************************/
/****** void RdImage(Image,Nrows,Ncols) ******/
/*Read from an input file the integers describing the image to
	be processed and store the corresponding character in the 2D array*/
void RdImage(char Image1[MAXROW][MAXCOL],int Nrows, int Ncols)
{
	int store;
	for(int x = 0; x < Nrows; x++){
		for(int j = 0; j < Ncols; j++){
			fscanf(fpin1, "%i", &store);
			if (store == 0){
				Image1[x][j] = '+';
			} else {
				Image1[x][j] = '&';
			}
		}
	}


}/*End of RdImage*/
/*************************************************************/
/****** void RdDoTask(Image1,Image2,Nrows,Ncols)***/
/*Read integers from an opened input file until EOF, and call
the appropriate stub routine for each task represented*/
void RdDoTask(char Image1[MAXROW][MAXCOL],
			char Image2[MAXROW][MAXCOL],int Nrows, int Ncols)
{\
	int task = 0;
	while(1){
		if (fscanf(fpin1, "%i", &task) != 1){
			break;
		}
		switch (task){
			case 1:
				VMirror(Image1, Image2, Nrows, Ncols);
				break;
			case 2: 
				HMirror(Image1, Image2, Nrows, Ncols);
				break;
			case 3:
				DiagR(Image1, Image2, Nrows, Ncols);
				break;
			case 4:
				DiagL(Image1, Image2, Nrows, Ncols);
				break;
			case 5:
				RotR(Image1, Image2, Nrows, Ncols);
				break;
		}
	}
} /*End RdDoTask*/

int main() {

    //int	eof;

    /* Initialize a 4x3 char image for testing*/
	//int Rsize1 = 4;
	//int Csize1 = 3;
	//char IMchr1[MAXROW][MAXCOL] = {{'+', '+', '&'},{'+', '&', '&'},{'+', '&', '&'},{'+', '&', '+'}};

	/* these are probably the real declarations you will need */
    	int Rsize1 = 0;
    	int Csize1 = 0;	/*image sizes*/
	char IMchr1[MAXROW][MAXCOL]; /*original image*/
	char IMchr2[MAXROW][MAXCOL]; /*resulting image after processing*/

	fprintf(stdout, "Hello:\n");		/*start of program*/

	/*open all input and output files*/
	fpin1 = fopen("A1In.txt", "r");  /* open the file for reading */
	if (fpin1 == NULL) {
		fprintf(stdout, "Cannot open input file - Bye\n");
		return(0); /*if problem, exit program*/
	}

	fpout1 = fopen("A1Out.txt", "w");  /* open the file for writing */
	if (fpout1 == NULL) {
		fprintf(stdout, "Cannot open output file - Bye\n");
	return(0); /*if problem, exit program*/
	}

	/*hello message to screen and output file*/
	fprintf(stdout, "\n Lucas Harvey - Student Number 192742 \n");
	fprintf(stdout, "\n File = A1.c	- Winter 2022 \n");
	fprintf(stdout, "\n Welcome to CSC 367, Assignment 1 \n\n");
	fprintf(fpout1, "\n Lucas Harvey - Student Number 192742 \n");
	fprintf(fpout1, "\n File = A1.c	- Winter 2022 \n");
	fprintf(fpout1, "\n Welcome to CSC 367, Assignment 1 \n\n");

	fprintf(stdout,"Starting: \n");
	fprintf(fpout1,"Starting: \n");

	/*Read in the sizes for the image*/
	RdSize(&(Rsize1), &(Csize1));
	/*Read in the image*/
	RdImage(IMchr1, Rsize1, Csize1);

	/*Print the initial image*/
	fprintf(stdout, "Initial IMchr1 contains: \n");
	fprintf(fpout1, "Initial IMchr1 contains: \n");
	PrImage(IMchr1, Rsize1, Csize1);

	/* read all integers from file until EOF - for each call the
	required stub routine for the image processing task*/
	RdDoTask(IMchr1, IMchr2, Rsize1, Csize1);

	/* Closure */
	fprintf(stdout, "\n The program is all done - Bye! \n");
	fprintf(fpout1, "\n The program is all done - Bye! \n");

	fclose(fpin1);  /* close the files */
	fclose(fpout1);

	return (0);
}/*End of Main*/
