using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaseStudy12._5
{
    
    public abstract class Employee:IPayable
    {
        public string FirstName { get; }
        public string LastName { get; }
        public string SocialSecurityNumber { get; }

        public Employee(string firstName, string lastname, string socialSecurityNumber)
        {
            FirstName = firstName;
            LastName = lastname;
            SocialSecurityNumber = socialSecurityNumber;
        }

        public override string ToString() => $"{FirstName} {LastName}\n"
            + $"social security number: {SocialSecurityNumber}";

        public abstract decimal Earnings();

        public decimal GetPaymentAmount() => Earnings();
    }
}
