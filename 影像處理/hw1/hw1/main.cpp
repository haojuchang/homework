#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
using namespace cv;
using namespace std;

/*
�N�Ϥ��W�b���[�W�ѼƫG��
�Ϥ��U�b����h�ѼƫG��
*/

int main(int argc, char *argv[])
{
	Mat imgS, imgD;

	imgS = imread(argv[1], CV_LOAD_IMAGE_COLOR); //Ū���Ϲ�
	imgS.copyTo(imgD);

	// �o��g�{���X���ܹ�����
	int inc = stoi(argv[2]); // inc �����ܶq
							 // ���[x,y]������b,g,r�i�ѤU�C�覡�s�� 
							 // imgD.at(y, x)[0]
							 // imgD.at(y, x)[1]
							 // imgD.at(y, x)[2]

	for (int r = 0; r < imgD.rows; r++) {
		for (int c = 0; c < imgD.cols; c++) {
			for (int i = 0; i < 3; i++) {
				// Adjust brightness
				// saturate_cast<uchar> ----> prevention overflow
				if (r < imgD.rows / 2)
					imgD.at<Vec3b>(r, c)[i] = saturate_cast<uchar>(imgD.at<Vec3b>(r, c)[i] + inc);
				else
					imgD.at<Vec3b>(r, c)[i] = saturate_cast<uchar>(imgD.at<Vec3b>(r, c)[i] - inc);
			}
		}
	}

	// ��ؿ��h���o��Ϲ��ɮצW��
	string filename = argv[1];
	size_t last_slash_idx = filename.find_last_of("\\/");
	filename.erase(0, last_slash_idx);



	// �[�W�ؿ� \output �g�X�ɮ�
	string pathOfile = ".\\output\\" + filename;
	imwrite(pathOfile, imgD);

	// �A�i�H�Q�ΤU�C�{���X�b�ۤv�q����ܹϹ��ݵ��G

	namedWindow("Source image", CV_WINDOW_AUTOSIZE);
	imshow("Source image", imgS);
	namedWindow("Output image", CV_WINDOW_AUTOSIZE);
	imshow("Output image", imgD);

	waitKey(0);
}