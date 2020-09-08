using System;


namespace HumanManage
{
    public class CommissionEmployee : Object
    {
        public string FisrtName { get; }
        public string LastName { get; }
        public string SocialSecurityNumber { get; }
        protected decimal grossSales; // doanh thu theo tuan
        protected decimal commissionRate; 

        public CommissionEmployee(string fisrtName, string lastName, string socialSecurityNumber, decimal grossSales,decimal commissionRate)
        {
            FisrtName = fisrtName;
            LastName = lastName;
            SocialSecurityNumber = socialSecurityNumber;
            GrossSales = grossSales;
            CommissionRate = commissionRate;
        }

        public decimal GrossSales
        {
            get
            {
                return grossSales;
            }
            set
            {
                if (value < 0)
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value, $"{nameof(GrossSales)} must be >= 0 ");
                }
                grossSales = value;
            }
        }

        public decimal CommissionRate
        {
            get
            {
                return commissionRate;
            }
            set
            {
                if (value <= 0 || value >=1)
                {
                    throw new ArgumentOutOfRangeException(nameof(value), value, $"{nameof(CommissionEmployee)} must be >0 and <1");
                }
                commissionRate = value;
            }
        }

        public decimal Earning()
            => commissionRate * grossSales;

        public override string ToString() =>
         $"comssion employee: {FisrtName} {LastName}\n" +
         $"social security number: {SocialSecurityNumber}\n" +
         $"gross sales: {grossSales:C}\n" +
         $"commission rate: {commissionRate:F2}";

    }
}
