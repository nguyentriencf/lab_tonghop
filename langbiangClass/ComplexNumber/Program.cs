using System;


namespace ComplexNumber
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("nhap so thuc cua x: ");
            double soThuc = double.Parse(Console.ReadLine());
            Console.Write("nhap so ao cua x: ");
            double soAO = double.Parse(Console.ReadLine());
            var x = new class1(soThuc, soAO);

            Console.Write("nhap so thuc cua y: ");
            soThuc = double.Parse(Console.ReadLine());
            Console.Write("nhapso ao cua y:");
            soAO = double.Parse(Console.ReadLine());
            var y = new class1(soThuc, soAO);

            
            Console.WriteLine($"{x} + {y} = {x + y}");
            Console.WriteLine($"{x} - {y} = {x - y}");
            Console.WriteLine($"{x} * {y} = {x * y}");


        }
    }
}
