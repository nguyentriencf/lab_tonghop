using System;


namespace Composition
{
    class Employee
    {
        public  Date NgaySinh { get;}
        public Date NgayThue { get;}
        public string Ho  { get;}
        public string Ten { get;}

        public Employee( string ho, string ten,  Date ngaysinh, Date ngayvaolam)
        {
            NgaySinh = ngaysinh;
            NgayThue = ngayvaolam;
            Ho = ho;
            Ten = ten;
        }

        public override string ToString()
        => $"{Ho}-{Ten}" + $"Ngay Vao Lam: {NgayThue} - Ngay sinh: {NgaySinh} " ;
    }
}
