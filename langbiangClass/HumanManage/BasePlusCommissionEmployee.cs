using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HumanManage
{
    public class BasePlusCommissionEmployee : CommissionEmployee
    {
        private decimal baseSalary;
        public BasePlusCommissionEmployee(string firstName, string lastName,string socialSecurityNumber, 
            decimal grossSales,decimal commissionRate, decimal baseSalary): base(firstName, lastName, socialSecurityNumber, grossSales, commissionRate)
        {
            BaseSalary = baseSalary;   
        }
        public decimal BaseSalary
        {
            get
            {
                return baseSalary;
            }
            set
            {
                if (value < 0)
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value, $"{nameof(BaseSalary)} must be >0 ");
                }
                baseSalary = value;
            }
        }

        public virtual decimal Earning() =>
            baseSalary + (CommissionRate + grossSales);
    }
}
