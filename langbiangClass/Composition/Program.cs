using System;


namespace Composition
{
    class Program
    {
        static void Main(string[] args)
        {
            var NgaySinh = new Date(9,3,2020);
            var NgayThue = new Date(12, 31, 2020);
            var NhanVien = new Employee("Nguyen", "Trien: ", NgayThue, NgaySinh);
            Console.WriteLine(NhanVien);
        }
    }
}
