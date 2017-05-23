/*
  Mohamed Tamara
  APCS2 pd5
  HW26 -- The English Do Not Wait In Line
  2017-03-28
*/

/*****************************************************
 * class LLQueue
 * uses a singly-linked nodes to implement a QUEUE
 * (a collection with FIFO property)
 *
 *       -------------------------------
 *   end |  --->   Q U E U E   --->    | front
 *       -------------------------------
 *
 ******************************************************/

import java.util.NoSuchElementException;
import java.lang.RuntimeException;

public class LLQueue<T> implements Queue<T> 
{
    private LLNode<T> _front, _end;

    // default constructor creates an empty queue
    public LLQueue()
	{ 
	    _front = new LLNode<T>(null,null);
	    _end = _front;
	}

    // means of adding a thing to the collection
    public void enqueue( T enQVal ) 
    {
	LLNode<T> next=new LLNode<T>(enQVal,null);
	if( isEmpty() ){
	    _front = next;
	    _end = next;
	}
	else{
	    _end.setNext(next);
	    _end = _end.getNext();
	}
    }//O(1)


    // means of removing a thing from the collection
    // remove and return thing at front of queue
    // assume _queue ! empty
    public T dequeue() 
    {
	T retVal = _front.getValue();
	_front = _front.getNext();
	return retVal;
    }//O(1)


    // means of peeking at thing next in line for removal
    public T peekFront() 
    {
	return _front.getValue();
    }//O(1)


    public boolean isEmpty() 
    {
	return _front.getValue() == null;
    }//O(1)


    // print each node, separated by spaces
    public String toString() 
    {
	String retStr = "";
	LLNode<T> front = _front;
	while( front != null ){// when the front value is null, the list past it is empty
	    retStr += front.getValue()+ " <-- ";// appends the front value, arrow points to the front
	    front = front.getNext();// traverses  
	}
	return retStr;
    }//O(n)



    public static void main( String[] args ) {


	  Queue<String> LLQueuelJ = new LLQueue<String>();

	  System.out.println("\nnow enqueuing thrice..."); 
	  LLQueuelJ.enqueue("James");
	  LLQueuelJ.enqueue("Todd");
	  LLQueuelJ.enqueue("Smith");

	  System.out.println("\nnow testing toString()..."); 
	  System.out.println( LLQueuelJ ); //for testing toString()...

	  System.out.println("\nnow dequeuing thrice..."); //FIFO :D
	  System.out.println( LLQueuelJ.dequeue() );// james
	  System.out.println( LLQueuelJ.dequeue() );// todd
	  System.out.println( LLQueuelJ.dequeue() );// smith
	  

	  System.out.println("\nDequeuing from empty queue should yield error..."); 
	  System.out.println( LLQueuelJ.dequeue() );
	/*v~~~~~~~~~~~~~~MAKE MORE~~~~~~~~~~~~~~v
	  ^~~~~~~~~~~~~~~~AWESOME~~~~~~~~~~~~~~~^*/

    }//end main

}//end class LLQueue
