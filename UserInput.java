import java.util.Scanner;

public class UserInput {

	static boolean isNumber;
	static Scanner getInput = new Scanner(System.in);
	static int tracks = 0;
	static int horseCount = 0;

	static void distanceInput() {
		
		do {

    		System.out.print("\nEnter Track Distance (Meters) from Start to Finish : ");

	    	if (getInput.hasNextInt()) {
	    		tracks = getInput.nextInt();
	    		isNumber = true;
	    		
	    	} else {
	    		invalidInput();
	    	}

	    	if ((tracks > 1000) || (tracks < 1)) {
				System.out.println("Please enter only from 1 - 1000!\n");
		    	isNumber = false;
	    	}

	    	System.out.print("\nTrack Created with the distace of : " + tracks + " meters.\n");

    	} while (!(isNumber));
		
	}

	static void horseInput() {
		
		do {

    		System.out.print("\nEnter Number of Horses : ");

	    	if (getInput.hasNextInt()) {
	    		horseCount = getInput.nextInt();
	    		isNumber = true;

	    	} else {
	    		invalidInput();
	    	}

	    	if ((horseCount > 100) || (horseCount < 1)) {
				System.out.println("Please enter only from 1 - 100!\n");
		    	isNumber = false;
	    	}

    	} while (!(isNumber));
	}

	static void promptEnterKey(){
	   System.out.println("\nPress \"ENTER\" to start the Race...");
	   Scanner scanner = new Scanner(System.in);
	   scanner.nextLine();
	}

	static void invalidInput() {
	    System.out.println("\nPlease enter a valid number!");
		isNumber = false;
		getInput.next();
	}

}