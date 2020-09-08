using System;
using System.Collections.Generic;
using System.Text;

namespace PlayingCard
{
    class DeckOfCards
    {
        // sinh số ngẫu nhiên
        private static Random randomNumbers = new Random();

        private const int NumberOfCard = 52; // số lượng con bài
        private Card[] deck = new Card[NumberOfCard]; // tạo 52 ô trống chứa lá bài
        private int CurrentCard = 0; // chia bài, lá bài trên cùng chuẩn bị chia

        // constructor đổ đầy bộ bài cho mỗi lá
        public DeckOfCards()
        {
            string[] faces = { "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K" };
            string[] suits = { "Co", "Ro", "Chuong", "Pich" };

            for (var Count = 0; Count < deck.Length; Count++)
            {
                deck[Count] = new Card(faces[Count % 13], suits[Count / 13]);
            }
            // count = 0
            // deck[0] = faces[0] = Ace --- suits[0] = Hearts
            // deck[1] = faces[1] = Deuce --- suits[0] = Hearts 
            // ...
            // deck[12] = faces[12] = King --- suits[0] = Hearts
            // count = 13
            // deck[13] = faces[0] = Ace  ---- suits[1] = Diamond
        }

        // khơi tạo hàm xáo bài
        public void Shuffe()
        {
            // sau khi xao bai, chia bài nên bắt đầu tại lại deck[0] 
            CurrentCard = 0; // khơi tạo lại CurrentCard

            // 
            for (var lan1 = 0; lan1 < deck.Length; ++lan1)
            {
                var lan2 = randomNumbers.Next(NumberOfCard);

                // 
                Card temp = deck[lan1];
                deck[lan1] = deck[lan2];
                deck[lan2] = temp;
            }
        }

        //khoi tao ham chia bai
        public Card Dealing()
        {
            if (CurrentCard < deck.Length)
            {
                return deck[CurrentCard++];
            }
            else
            {
                return null; // chỉ rõ tất cả lá bài đã đc xử lý
            }
            
        }

    }
}
