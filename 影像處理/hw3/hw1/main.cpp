#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <string>
#include <vector>

using namespace cv;
using namespace std;

void imageShow(Mat &imgS, string name);	// 你可以利用下列程式碼在自己電腦顯示圖像看結果
string getFileName(int argc, char *argv[]);	// 把目錄去掉得到圖像檔案名稱
void outputFile(Mat &imgD, string &filename);	// 加上目錄 \output 寫出檔案
Mat draw_histogram(Mat& img); // 繪製直方圖
Mat covertToGray(Mat imgS); // 轉成灰階
Mat  histogram_equalization(Mat imgS); // 直方圖均化
int main(int argc, char *argv[])
{

	Mat srcImg, grayImg, grayHis, equImg, equHis;
	srcImg = imread(argv[1], CV_LOAD_IMAGE_COLOR); //讀取圖像

	grayImg = covertToGray(srcImg);
	grayHis = draw_histogram(grayImg);
	equImg = histogram_equalization(grayImg);
	equHis = draw_histogram(equImg);

	imageShow(grayImg, "Gray Image");
	imageShow(grayHis, "Gray histogram");
	imageShow(equImg, "Equalization Image");
	imageShow(equHis, "Equalization histogram");

	waitKey(0);
}

void imageShow(Mat &imgS, string name)
{
	// 你可以利用下列程式碼在自己電腦顯示圖像看結果

	namedWindow(name, CV_WINDOW_AUTOSIZE);
	imshow(name, imgS);
}

string getFileName(int argc, char *argv[]) 
{
	// 把目錄去掉得到圖像檔案名稱

	string filename = argv[1];
	size_t last_slash_idx = filename.find_last_of("\\/");
	filename.erase(0, last_slash_idx);
	return filename;
}

void outputFile(Mat &imgD, string &filename)
{
	// 加上目錄 \output 寫出檔案
	string pathOfile = ".\\output\\" + filename;
	imwrite(pathOfile, imgD);

}

Mat draw_histogram(Mat& img)
{
	// 繪製直方圖

	int channels = 0;
	MatND dstHist;
	int histSize[] = { 256 };     
	float midRanges[] = { 0, 256 };
	const float *ranges[] = { midRanges };

	calcHist(&img, 1, &channels, Mat(), dstHist, 1, histSize, ranges, true, false);

	Mat drawImage(256, 256, CV_8UC3, Scalar(255, 255, 255));
	double g_dHistMaxValue;
	minMaxLoc(dstHist, 0, &g_dHistMaxValue, 0, 0);
	for (int i = 0; i < 256; i++)
	{
		int value = cvRound(dstHist.at<float>(i) * 256 * 0.9 / g_dHistMaxValue);

		line(drawImage, Point(i, drawImage.rows - 1), Point(i, drawImage.rows - 1 - value), Scalar(0, 0, 0));
	}

	return drawImage;
}

Mat covertToGray(Mat imgS)
{
	// 轉成灰階

	Mat imgD;
	cvtColor(imgS, imgD, CV_BGR2GRAY);//RGB to Gray
	return imgD;
}

Mat  histogram_equalization(Mat imgS)
{
	// 直方圖均化

	Mat imgD;
	imgS.copyTo(imgD);
	size_t dot = imgS.rows * imgS.cols; // 有幾個像素
	int *temp = new int[256]; // 256 個色階
	double *new_level = new double[256]; // 256 個新色階

	// 初始化
	for (int i = 0; i < 256; i++)
	{
		temp[i] = 0;
		new_level[i] = 0.0;
	}

	// 各個色階有幾個
	for (int x = 0; x < imgS.rows; x++)
	{
		for(int y = 0; y < imgS.cols; y++)
		{
			temp[int(imgD.at<uchar>(x, y))] ++;
		}
	}

	for (int i = 0; i < 256; i++)
	{
		for (int j = i; j >= 0; j--)
			new_level[i] += temp[j];
		new_level[i] = new_level[i] * 255 / dot;
	}

	// 四捨五入
	for (int i = 0; i < 256; i++)
		temp[i] = int(new_level[i] + 0.5);

	// 均化
	for (int x = 0; x < imgS.rows; x++)
	{
		for (int y = 0; y < imgS.cols; y++)
		{
			imgD.at<uchar>(x, y) = uchar(temp[int(imgD.at<uchar>(x, y))]);
		}
	}

	return imgD;
}