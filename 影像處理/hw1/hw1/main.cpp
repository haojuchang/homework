#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
using namespace cv;
using namespace std;

/*
將圖片上半部加上參數亮度
圖片下半部減去參數亮度
*/

int main(int argc, char *argv[])
{
	Mat imgS, imgD;

	imgS = imread(argv[1], CV_LOAD_IMAGE_COLOR); //讀取圖像
	imgS.copyTo(imgD);

	// 這邊寫程式碼改變像素值
	int inc = stoi(argv[2]); // inc 為改變量
							 // 位於[x,y]像素的b,g,r可由下列方式存取 
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