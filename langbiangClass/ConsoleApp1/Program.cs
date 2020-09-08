using System;
using System.Linq;

    class Program
{
    static void Main()
    {
        //if(args.Length != 3)
        //{
        //    Console.WriteLine("truyen tham so khong dung: ");
        //}
        //else
        //{
        //    var arrayLength = int.Parse(args[0]);
        //    var array = new int[arrayLength];

        //    var initialValue = int.Parse(args[1]);
        //    var increment = int.Parse(args[2]);

        //    for (var counter = 0; counter < array.Length; ++counter)
        //    {
        //        array[counter] = initialValue + increment * counter;
        //    }
        //    Console.WriteLine($"{"index"}{"value", 8}");

        //    for (var counter = 0; counter < array.Length; ++counter)
        //    {
        //        Console.WriteLine($"{counter,5}{array[counter],8}");
        //    }

        //}
        //var values = new[] { 2,6, 9, 8, 0, 3, 3, 7, 5 };

        //Console.WriteLine("mang goc la: ");
        //foreach (var element in values)
        //{
        //    Console.Write($"{element} ");
        //}

        //Console.WriteLine();
        //var filtered =
        //    from item in values
        //    where item > 4
        //    select item;

        //Console.WriteLine("mang da loc la: ");
        //foreach (var element in filtered)
        //{
        //    Console.Write($"{element} ");
        //}

        //var sorted =
        //    from value in values
        //    orderby value
        //    select value;
        //Console.WriteLine("\n mang da duoc sap xep la: \n");
        //foreach (var item in sorted)
        //{
        //    Console.Write($"{item} "); 
        //}

        //var sortFilteredResults =
        //   from value in filtered
        //   orderby value ascending
        //   select value;
        //Console.WriteLine("\n mang gom cac so lon hon 4, sap xep giam dan: \n");
        //foreach (var item in sortFilteredResults)
        //{
        //    Console.Write($"{item} ");
        //}

        //Console.WriteLine();
        //var sortAndFilter =
        //    from value in values
        //    where value > 4
        //    orderby value descending
        //    select value;
        //Console.WriteLine("\n mang gia tri lon hon 4 vao sap xep theo gia tri giam dan \n");
        //foreach (var item in sortAndFilter)
        //{
        //    Console.Write($"{item} ");
        //}
        var employees = new[]
        {
            new Employee("Jason", "Red", 5000M),
            new Employee("Ashley", "Green", 7600M),
            new Employee("Matthew", "Indigo", 3587.5M),
            new Employee("James", "Indigo", 4700.77M)
        };

        Console.WriteLine("Original arrat:");
        foreach (var item in employees)
        {
            Console.WriteLine(item);
        }

        var betweent4K6K =
            from e in employees
            where (e.MonthSalary >= 4000M) && (e.MonthSalary <= 6000M)
            select e;
        Console.WriteLine();
        Console.WriteLine("Danh sach nhan vien co luong tu 4K dem 6K :");
        foreach (var item in betweent4K6K)
        {
            Console.WriteLine(item);
        }

        var sortedName =
            from e in employees
            orderby (e.LastName), e.FisrtName
            select e;
        Console.WriteLine();

        Console.WriteLine("danh sach nhan vien da sap xep:");
        foreach (var item in sortedName)
        {
            Console.WriteLine(item);
        }

        Console.WriteLine();
        Console.WriteLine("nhan vien dau tien trong danh sach da sap xep la: ");
        if (sortedName.Any())
        {
            Console.WriteLine(sortedName.First());
        }
        else
        {
            Console.WriteLine("\n khong co nhan vien nao: ");
        }  
    }
}