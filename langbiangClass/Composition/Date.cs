using System;

namespace Composition
{
    class Date
    {
        private int thang;
        private int ngay;

        public int Nam { get; private set; }

        public Date(int thang, int ngay,  int nam)
        {
           
            Thang = thang;

            Ngay = ngay;

            Nam = nam;
           
            Console.WriteLine($"constructor doi tuong ngay cho ngay {this}");

        }

       public int Thang
        {
            get
            {
                return thang;
            }
            private set
            {
                if(value <= 0 || value > 12 )
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value, $"{nameof(Thang)} phai tu 1-12");
                }
                thang = value;
            }
        }

        public int Ngay
        {
            get
            {
                return ngay;
            }
            private set
            {
                int[] HopLe = { 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                if(value <= 0 || value > HopLe[Thang - 1])
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value,$"{nameof(Ngay)}");
                }
                if (Thang == 2 && value == 29 && 
                    !(Nam % 400 ==0) || (Nam % 4 == 0 && Nam %100 != 0))
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value, $"{nameof(Ngay)} vuot ra khoi thang/nam");
                }
                ngay = value;
            }
        }
        public override string ToString()
        => $"{Ngay} - {Thang} - {Nam}";

    }
}
