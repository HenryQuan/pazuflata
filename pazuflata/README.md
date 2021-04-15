# pazuflata
Use pazusoba in Flutter 

## Async
- https://github.com/dart-lang/sdk/tree/master/samples/ffi/async
- https://github.com/dart-lang/sdk/issues/37022

The library is loaded successfully but how to call it async? It is definitely using the main thread. 
The main issue is that pazusoba uses all threads to boost the performance so the lag is inevitable I think. 
