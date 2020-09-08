using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaseStudy12._5
{
    class Program
    {
        static void Main(string[] args)
        {
            //var salariedEmployee = new SalariedEmployee("John", "Smith", "111-11-111",800.00M);
            // var houlyEmployee = new HourlyEmployee("Karen","Price", "222-22-222", 16.75M,40.00M);
            // var commissionEmployee = new CommissionEmployee("Sue", "Jones", "333-33-333", 10000.00M, .06M);
            // var basePluscomissionEmployee = new BasePlusCommissionEmployee("Bob", "Lewis","444-44-444", 5000.00M, .04M, 300.00M);

            // Console.WriteLine("nhan vien xu ly theo ca nhan:");

            // Console.WriteLine($"{salariedEmployee} Earning:{salariedEmployee.Earnings()}\n");
            // Console.WriteLine($"{houlyEmployee} Earning: {houlyEmployee.Earnings()}\n");
            // Console.WriteLine($"{commissionEmployee} Earning: {commissionEmployee.Earnings()}\n");
            // Console.WriteLine($"{basePluscomissionEmployee} Earning: {basePluscomissionEmployee.Earnings()}");

            // Console.WriteLine("nhan vien xu    ly theo da hinh");

            // var employees = new List<Employee> {salariedEmployee, houlyEmployee, commissionEmployee, basePluscomissionEmployee };

            // foreach (var item in employees)
            // {
            //     Console.WriteLine($"{item}");
            //     if (item is BasePlusCommissionEmployee)
            //     {
            //         var employee = (BasePlusCommissionEmployee)item;
            //         employee.BaseSalary *= 1.10M;
            //         Console.WriteLine($"new base salary with increase is :" + $"{employee.BaseSalary:C}");  
            //     }
            //     Console.WriteLine($"earning: {item.Earnings()}\n");

            // }

            // for (int i = 0; i < employees.Count; i++)
            // {
            //     Console.WriteLine(
            //        $"Employee {i} is a {employees[i].GetType()}\n");
            // }

            var payableOjects = new List<IPayable>  {
                new Invoice("01234", "seat", 2, 375.00M),
                new Invoice("56789", "tire", 4, 79.95M),
                new SalariedEmployee("John", "Smith", "111-11-1111", 800.00M),
                new SalariedEmployee("Lisa", "Barnes", "888-88-8888", 1200.00M)

            };

            Console.WriteLine("Invoie and Employee processed pholymorphicall:\n");

            foreach (var item in payableOjects)
            {
                Console.WriteLine($"{item}");
                Console.WriteLine($"payment due: {item.GetPaymentAmount():C}\n");
            }

            
        }
    }
}
