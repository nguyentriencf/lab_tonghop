//using System;



//    class AutoPolicy
//    {
//        public int AccountNumber { get; set; }

//        public string MakeAndModel { get; set; }

//        public string State { get; set; }

//        public AutoPolicy(int accountNumber, string makeAndModel, string state)
//        {
//            AccountNumber = accountNumber;
//            MakeAndModel = makeAndModel;
//            State = state;
//        }

//        public bool IsNoFaultState
//        {
//            get
//            {
//                bool noFoultState;
//                switch (State)
//                {
//                    case "MA":
//                    case "NJ":
//                    case "NY":
//                    case "PE":
//                        noFoultState = true;
//                    break;
//                    default:
//                        noFoultState = false;
//                        break;
//                }

//                return noFoultState;
//            }
//        }
//    }

