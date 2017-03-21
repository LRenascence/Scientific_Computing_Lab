#include <iostream>
#include <cstdio>
#include <cmath>
#include <limits>
#include <iomanip>
using namespace std;
void InfiniteSeries()
{
    float float_sum=0.0f;
    float float_presum=0.0f;
    double double_presum=0.0d;
    double double_sum=0.0d;
    long long int n=1;
    cout<<"With float"<<endl;
    while(true)
    {
        //�ȳ��Խ��мӷ����ж��Ƿ��б仯
        float_presum+=1.0f/n;
        if(float_presum==float_sum)
        {
            cout<<"Number: "<<n<<endl;
            cout<<"Sum: "<<float_sum<<endl;
            break;
        }

        float_sum=float_presum;
        n++;
    }
    n=1;
    cout<<"With double"<<endl;
    while(true)
    {
        //�ȳ��Խ��мӷ����ж��Ƿ��б仯
        double_presum+=1.0/n;
        if(double_presum-double_sum<1e-9)//��Ҫ����һ��ʱ��
        {
            cout<<"Number: "<<n<<endl;
            cout<<"Sum: "<<double_sum<<endl;
            break;
        }
        double_sum=double_presum;
        n++;
    }
}
void QuadraticEquation()
{
    double a,b,c;
    string str;
    while(true)
    {
        cout<<"Run a quadratic equation?(y/n)"<<endl;
        cin>>str;
        if(str!="y")
            break;
        cout<<"input a,b,c"<<endl;
        cin>>a>>b>>c;
        //����a=0�����
        if(a==0)
        {
            //���c/b���
            if(abs(c/b)>numeric_limits<double>::max()||abs(c/b)<numeric_limits<double>::min())
            {
                cout<<"Can not calculate"<<endl;
                continue;
            }
            else
            {
                cout<<"x="<<c/b<<endl;
                continue;
            }
        }
        //�����б�ʽ�е����Ƿ����������
        if(abs(b*b)>numeric_limits<double>::max()||abs(-4*a*c)>numeric_limits<double>::max())
        {
            double scale=10.0;
            //���Ͻ�a,b,c��С10����ֱ��������
            while(abs(b*b)>numeric_limits<double>::max()||abs(-4*a*c)>numeric_limits<double>::max())
            {
                //���һ���������磬��һ������������
                if(abs(b*b)<numeric_limits<double>::min()||abs(-4*a*c)<numeric_limits<double>::min())
                {
                    //�����b*b���磬���޽�
                    if(abs(b*b)<numeric_limits<double>::min())
                    {
                        cout<<"No real number solution"<<endl;
                        continue;
                    }
                    else
                    {
                        //�޷�������ƽ�
                        if(abs(-b/a)>numeric_limits<double>::max())
                            cout<<"Can not calculate with double, the approximate solution x=-b/(2*a) also can not calculate"<<endl;
                        //��������ƽ��
                        else
                            cout<<"Can not calculate with double, the two approximate solutions are both "<<-b/a<<endl;
                        continue;
                    }
                }
                a/=scale;
                b/=scale;
                c/=scale;
            }
        }
        //�����б�ʽ���Ƿ����������
        else if(abs(b*b)<numeric_limits<double>::min()||abs(-4*a*c)<numeric_limits<double>::min())
        {
            double scale=10.0;
            //���Ͻ�a,b,c�Ŵ�10����ֱ��������
            while(abs(b*b)<numeric_limits<double>::min()||abs(-4*a*c)<numeric_limits<double>::min())
            {
                //���һ���������磬��һ������������
                if(abs(b*b)>numeric_limits<double>::max()||abs(-4*a*c)>numeric_limits<double>::max())
                {
                    //�����b*b���磬���޽�
                    if(abs(b*b)<numeric_limits<double>::min())
                    {
                        cout<<"No real number solution"<<endl;
                        continue;
                    }
                    else
                    {
                        //�޷�������ƽ�
                        if(abs(-b/a)>numeric_limits<double>::max())
                            cout<<"Can not calculate with double, the approximate solution x=-b/(2*a) also can not calculate"<<endl;
                        //��������ƽ�ģ�eg. a=6 b=5e158 c=-4e-400
                        else
                            cout<<"Can not calculate with double, the two approximate solutions are both "<<-b/a<<endl;
                        continue;
                    }
                }
                a*=scale;
                b*=scale;
                c*=scale;
            }
        }
        double delta=b*b-4*a*c;
        double x1,x2;
        if(delta<0)
        {
            cout<<"No real number solution"<<endl;
            continue;
        }
        //����b��sqrt��delta�����Ƶ���
        if(b<=0)
        {
            x1=(-b+sqrt(delta))/(2*a);
            x2=2*c/(-b+sqrt(delta));
        }
        else
        {
            x1=(-b-sqrt(delta))/(2*a);
            x2=2*c/(-b-sqrt(delta));
        }
        cout<<"x1="<<x1<< " x2="<<x2<<endl;
    }
}
int main()
{
    InfiniteSeries();
    QuadraticEquation();
}
