#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <string>
#include <cmath>
#define M_PI 3.14159265358979323846264338328
using namespace cv;
using namespace std;

// �Q��opencv ���ب�Ƨ@rotate
Mat rotate(Mat src, double angle)
{
	Mat dst;
	src.copyTo(dst);
	// �ܶ�(dst�k�s)
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
			p.x = (x - center.x) * cos(angle) - (y - center.y) * sin(angle);
			p.y = (x - center.x) * sin(angle) + (y - center.y) * cos(angle);
			p.x += center.x;
			p.y += center.y;
			if (p.x < src.rows && p.y < src.cols && p.x >= 0 && p.y >= 0)
			{
				for (int i = 0; i < 3; i++)
				{
					dst.at<Vec3b>(x, y)[i] = src.at<Vec3b>(p.x, p.y)[i];
				}
			}
		}
	}
	return dst;
}
int main(int argc, char *argv[])
{

	Mat imgS, imgD;

	imgS = imread(argv[1], CV_LOAD_IMAGE_COLOR); //Ū���Ϲ�

												 // �Ѥ޼�Ū�����ਤ��
	double angle = stoi(argv[2]);
	imgD = rotate(imgS, angle * M_PI /180);

	// ��ؿ��h���o��Ϲ��ɮצW��
	string filename = argv[1];
	size_t last_slash_idx = filename.find_last_of("\\/");
	filename.erase(0, last_slash_idx);

	// �[�W�ؿ� \output �g�X�ɮ�
	string pathOfile = ".\\output\\" + filename;
	imwrite(pathOfile, imgD);

	// �A�i�H�Q�ΤU�C�{���X�b�ۤv�q����ܹϹ��ݵ��G

	/*namedWindow("Source image", CV_WINDOW_AUTOSIZE);
	imshow("Source image", imgS);
	namedWindow("Output image", CV_WINDOW_AUTOSIZE);
	imshow("Output image", imgD);*/

	waitKey(0);

}