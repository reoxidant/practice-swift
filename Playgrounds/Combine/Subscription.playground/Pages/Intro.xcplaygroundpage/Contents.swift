/*
 
 ==== Subscription ====
 
 How to create a subscription?
add a Subscriber to a publisher with
 -> sink(completion: { },receiveValue: { })
 -> assign(to: on:)
 -> assign(to: )
 
How to stop a data stream?
-> subscription.cancel()
-> subscription = nil
-> error will cancel subscription with failure
 
sequence publihser, one-shot publisher
-> finish automatically when done
 

---- Multithreading in Combine ----
-> receive on
-> subscribe to
-> where is multithreading built in? - urlsession
 
 */
