using System;
using ServiceStack.Redis;

namespace RedisData
{
    class Program
    {
        static string redisConnectionString = "au9bdRajjLcgFggwsDedQ0bATOy5xfPcLAzCaAluzlY=@MyRedis01905389.redis.cache.windows.net:6380?ssl=true";
        
        static void Main(string[] args)
        {
            bool transactionResult = false;

            using (RedisClient redisClient = new RedisClient(redisConnectionString))
            using (var transaction = redisClient.CreateTransaction())
            {
                //Add multiple operations to the transaction
                transaction.QueueCommand(c => c.Set("MyKey1", "MyValue1"));
                transaction.QueueCommand(c => c.Set("MyKey2", "MyValue2"));

                //Add an expiration time
                transaction.QueueCommand(c => ((RedisNativeClient)c).Expire("MyKey1", 15));
                transaction.QueueCommand(c => ((RedisNativeClient)c).Expire("MyKey2", 15));

                //Commit and get result of transaction
                transactionResult = transaction.Commit();
            }

            if (transactionResult)
            {
                Console.WriteLine("Transaction committed");
            }
            else
            {
                Console.WriteLine("Transaction failed to commit");
            }            
        }
    }
}
