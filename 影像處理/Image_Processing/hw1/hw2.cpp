#include "homework.h"
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <string>
#include <cmath>
#define M_PI 3.14159265358979323846264338328
using namespace cv;
using namespace std;

// 利用opencv 內建函數作rotate
Mat rotate(Mat src, double angle)
{
	Mat dst;
	src.copyTo(dst);
	// 變黑(dst歸零)
	for (int x = 0; x < src.rows; x++)
		for (int y = 0; y < src.cols; y++)
			for (int i = 0; i < 3; i++)
				dst.at<Vec3b>(x, y)[i] = 0;

	Point2f center(src.cols / 2., src.rows / 2.);

	for (int x = 0; x < src.rows; x++)
	{
		for (int y = 0; y < src.cols; y++)
		{
			Point p;
			p.x = (x - center.x) * cos(angle) - (y  - center.y) * sin(angle);
			p.y = (x - center.x) * sin(angle) + (y - center.y) * cos(angle);
			p.x += center.x;
			p.y += center.y;
			if (p.x < src.rows && p.y < src.cols && p.x >= 0 && p.y >=0)
			{
				for (int i = 0; i < 3; i++)
				{
					dst.at<Vec3b>(p.x, p.y)[i] = src.at<Vec3b>(x, y)[i];
				}
			}
		}
	}
	//遮罩把黑點去除
	for (int x = 1; x < src.rows - 1; x++)
	{
		for (int y = 1; y < src.cols - 1; y++)
		{
			if (dst.at<Vec3b>(x, y) == Vec3b(0, 0, 0))
			{
				for (int i = 0; i < 3; i++)
				{
					dst.at<Vec3b>(x, y)[i] = (dst.at<Vec3b>(x - 1, y)[i] + dst.at<Vec3b>(x, y + 1)[i] + dst.at<Vec3b>(x + 1, y)[i] + dst.at<Vec3b>(x, y - 1)[i] + 
						dst.at<Vec3b>(x - 1, y -1)[i] + dst.at<Vec3b>(x + 1, y + 1)[i] + dst.at<Vec3b>(x + 1, y - 1)[i] + dst.at<Vec3b>(x + 1, y - 1)[i]) / 8;
				}
			}
		}			
	}
	return dst;
}
void homework::hw2(int argc, char *argv[])
{

	Mat imgS, imgD;

	imgS = imread(argv[1], CV_LOAD_IMAGE_COLOR); //讀取圖像

												 // 由引數讀取旋轉角度
	double angle = stoi(argv[2]) / M_PI;
	imgD = rotate(imgS, angle);

	// 把目錄去掉得到圖像檔案名稱
	string filename = argv[1];
	size_t last_slash_idx = filename.find_last_of("\\/");
	filename.erase(0, last_slash_idx);

	// 加上目錄 \output 寫出檔案
	string pathOfile = ".\\output\\" + filename;
	imwrite(pathOfile, imgD);

	// 你可以利用下列程式碼在自己電腦顯示圖像看結果
	
	namedWindow("Source image", CV_WINDOW_AUTOSIZE);
	imshow("Source image", imgS);
	namedWindow("Output image", CV_WINDOW_AUTOSIZE);
	imshow("Output image", imgD);

	waitKey(0);
	
}