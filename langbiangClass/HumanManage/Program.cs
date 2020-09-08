using System;

namespace HumanManage
{
    class Program
    {
        static void Main(string[] args)
        {
            var employee = new CommissionEmployee("Trien", "Nguyen","251-179-290", 10000.00M, .06M);

            Console.WriteLine(
                "Employee information obtained by properties and methobs: \n");
            Console.WriteLine($"First name is {employee.FisrtName}");

            Console.WriteLine($"Last name is {employee.LastName}");
            Console.WriteLine(
                $"Social security nember is {employee.SocialSecurityNumber}");
            Console.WriteLine($"Gross sales are {employee.GrossSales:C}");

            Console.WriteLine(
                $"Commision rate is {employee.CommissionRate:F2}");
            Console.WriteLine($"Earning are {employee.Earning():C}");

            employee.GrossSales = 5000.00M;
            employee.CommissionRate = .1M;

            Console.WriteLine(
                "\nUpdeted employee information abtained by Tostring:\n");
            Console.WriteLine(employee);
            Console.WriteLine($"earning: {employee.Earning():C}");

        }
    }
}
