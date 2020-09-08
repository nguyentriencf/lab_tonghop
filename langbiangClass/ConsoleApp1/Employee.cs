using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



    class Employee
    {
        public string FisrtName { get; }
        public string LastName { get; }
        private decimal monthlySalalry;

       public Employee(string fisrtName, string lastName, decimal monthSalary)
        {
            FisrtName = fisrtName;
            LastName = lastName;
        MonthSalary = monthSalary;
        }

        public decimal MonthSalary
        {
         
            get
            {
          

            return monthlySalalry;
            }
            set
            {
           
                if (value >= 0M)
                {
                    monthlySalalry = value;
                }
            }   
        }
        public override string ToString() => $"{FisrtName,-10}{LastName,-10}{MonthSalary,10:C}";
       
    }

