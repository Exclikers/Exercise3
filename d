[1mdiff --git a/HorseRacingMain$1.class b/HorseRacingMain$1.class[m
[1mdeleted file mode 100644[m
[1mindex deb5969..0000000[m
Binary files a/HorseRacingMain$1.class and /dev/null differ
[1mdiff --git a/HorseRacingMain.class b/HorseRacingMain.class[m
[1mdeleted file mode 100644[m
[1mindex e3c3ff9..0000000[m
Binary files a/HorseRacingMain.class and /dev/null differ
[1mdiff --git a/HorseRacingMain.java b/HorseRacingMain.java[m
[1mdeleted file mode 100644[m
[1mindex e85e08d..0000000[m
[1m--- a/HorseRacingMain.java[m
[1m+++ /dev/null[m
[36m@@ -1,22 +0,0 @@[m
[31m-[m
[31m-[m
[31m-public class HorseRacingMain {[m
[31m-	[m
[31m-	public static void main(String[] args) {[m
[31m-[m
[31m-		UserInput input = new UserInput();[m
[31m-		HorseService horseService = new HorseServiceImpl();[m
[31m-[m
[31m-		System.out.println();[m
[31m-		System.out.println("===================================");[m
[31m-    	System.out.println("|| WELCOME TO HORSE RACING GAME! ||");[m
[31m-    	System.out.println("===================================");[m
[31m-[m
[31m-		horseService.createHorses(input.tracks);[m
[31m-		horseService.filterHorses();[m
[31m-		horseService.validateHorses();[m
[31m-		horseService.raceStart(input.tracks);[m
[31m-		horseService.raceEnd(input.tracks, horseService.raceStart(input.tracks));[m
[31m-	}[m
[31m-[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/HorseService.class b/HorseService.class[m
[1mdeleted file mode 100644[m
[1mindex 00ba652..0000000[m
Binary files a/HorseService.class and /dev/null differ
[1mdiff --git a/HorseService.java b/HorseService.java[m
[1mdeleted file mode 100644[m
[1mindex b09d7cd..0000000[m
[1m--- a/HorseService.java[m
[1m+++ /dev/null[m
[36m@@ -1,14 +0,0 @@[m
[31m-import java.util.List;[m
[31m-import java.util.ArrayList;[m
[31m-[m
[31m-public interface HorseService {[m
[31m-[m
[31m-	void createHorses(int tracks);[m
[31m-	void filterHorses();[m
[31m-	void validateHorses();[m
[31m-	List<Integer> raceStart(int tracks);[m
[31m-	void raceEnd(int tracks, List<Integer> speed);[m
[31m-	[m
[31m-	List<Horses> horseList = new ArrayList<>();[m
[31m-	List<Horses> filteredHorse = new ArrayList<>();[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/HorseServiceImpl.class b/HorseServiceImpl.class[m
[1mdeleted file mode 100644[m
[1mindex c2afc7d..0000000[m
Binary files a/HorseServiceImpl.class and /dev/null differ
[1mdiff --git a/HorseServiceImpl.java b/HorseServiceImpl.java[m
[1mdeleted file mode 100644[m
[1mindex 9629f0d..0000000[m
[1m--- a/HorseServiceImpl.java[m
[1m+++ /dev/null[m
[36m@@ -1,196 +0,0 @@[m
[31m-import java.util.Random;[m
[31m-import java.util.stream.Stream;[m
[31m-import java.util.stream.Collectors;[m
[31m-import java.util.Optional;[m
[31m-import java.util.stream.IntStream;[m
[31m-import java.util.List;[m
[31m-import java.util.ArrayList;[m
[31m-[m
[31m-[m
[31m-public class HorseServiceImpl implements HorseService {[m
[31m-[m
[31m-	static String winner = null;[m
[31m-[m
[31m-	public void createHorses(int tracks) {[m
[31m-		[m
[31m-		UserInput hcount = new UserInput();[m
[31m-		Random randomPick = new Random(); [m
[31m-		warCry();[m
[31m-[m
[31m-		if (tracks == 0) {[m
[31m-			UserInput.distanceInput();[m
[31m-		}[m
[31m-		[m
[31m-		UserInput.horseInput();[m
[31m-[m
[31m-		IntStream.range(1, (hcount.horseCount + 1)).forEach(num -> {[m
[31m-			int randWarCry = randomPick.nextInt(warCry().size()); [m
[31m-			horseList.add(new Horses("horse" + num, randomPick.nextBoolean(), 0, warCry().get(randWarCry)));[m
[31m-		} );[m
[31m-[m
[31m-		System.out.println("\nList of Horses Created!\n");[m
[31m-		horseList.forEach(System.out::println);[m
[31m-[m
[31m-	}[m
[31m-[m
[31m-	public void filterHorses() {[m
[31m-[m
[31m-		horseList.parallelStream()[m
[31m-				.filter(h -> h.healthy.equals(true))[m
[31m-		        .collect(Collectors.toList())[m
[31m-		        .forEach(f -> filteredHorse.add(f));[m
[31m-[m
[31m-		System.out.println("\nHealthy Horse Selected!\n");[m
[31m-[m
[31m-		filteredHorse.stream().forEach(h -> System.out.println(h.printHorseList()));[m
[31m-[m
[31m-		System.out.println("\nNumber of Healthy Horses : " + filteredHorse.size());[m
[31m-		[m
[31m-	}[m
[31m-[m
[31m-	public void validateHorses() {[m
[31m-[m
[31m-		UserInput input = new UserInput();[m
[31m-[m
[31m-		if (filteredHorse.size() >= 2) {[m
[31m-				UserInput.promptEnterKey();[m
[31m-			countdownTimer();		[m
[31m-		} else {[m
[31m-			System.out.println("Cannot Start the race if Horse is less than 2!");[m
[31m-			clearHorses(warCry());[m
[31m-			createHorses(input.tracks);[m
[31m-			filterHorses();[m
[31m-			validateHorses();[m
[31m-		}[m
[31m-[m
[31m-	}[m
[31m-[m
[31m-	public void clearHorses(List<String> warCries) {[m
[31m-		warCries.clear();[m
[31m-		horseList.clear();[m
[31m-		filteredHorse.clear();[m
[31m-	}[m
[31m-[m
[31m-	public List<Integer> raceStart(int tracks) {[m
[31m-[m
[31m-		List<Integer> speed = new ArrayList<>();	[m
[31m-		[m
[31m-		boolean finish = false;[m
[31m-		int horses = filteredHorse.size();[m
[31m-		IntStream.range(0, (horses)).forEach(i -> speed.add(0));[m
[31m-[m
[31m-		do {[m
[31m-			for (int i = 0; i < horses; i++) {[m
[31m-        	//IntStream.range(0, (horses)).forEach(i -> {[m
[31m-	        	    speed.set(i, speed.get(i) + 1+ (((int) (Math.random() * 10)/2)));[m
[31m-		    [m
[31m-		   			 filteredHorse.set(i, new Horses(filteredHorse.get(i).getName(), [m
[31m-	        		   						   filteredHorse.get(i).getHealth(), [m
[31m-	        		   						   speed.get(i), [m
[31m-	        		   						   filteredHorse.get(i).getWarCry()));[m
[31m-					if (speed.get(i) >= tracks) {[m
[31m-						finish = true;[m
[31m-						break;	[m
[31m-					}[m
[31m-					[m
[31m-	        }[m
[31m-			/*	        [m
[31m-	        System.out.println("\n\n\n");[m
[31m-[m
[31m-   			IntStream.range(0, (horses)).forEach(x -> { [m
[31m-			  				System.out.println(filteredHorse.get(x).getName() [m
[31m-			  				+" traveled: " + speed.get(x) + " meters. " [m
[31m-			  				+ (tracks - speed.get(x)) + "m left.");				[m
[31m-  			});[m
[31m-[m
[31m-   			System.out.println("\n");[m
[31m-[m
[31m-	        IntStream.range(0, (horses)).forEach(x -> {[m
[31m-	        	IntStream.range(0, speed.get(x)).forEach(i -> {[m
[31m-	        		System.out.print("*");[m
[31m-	        	});[m
[31m-	        	System.out.println(filteredHorse.get(x).getName());   [m
[31m-	        } );[m
[31m-	       */ [m
[31m-[m
[31m-	    } [m
[31m-		while (finish != true);  [m
[31m-		return speed;[m
[31m-	}[m
[31m-[m
[31m-	public void raceEnd(int tracks, List<Integer> speed) {[m
[31m-[m
[31m-		List<String> endRace = new ArrayList<>();[m
[31m-[m
[31m-		int horses = filteredHorse.size();[m
[31m-		IntStream.range(0, (horses)).forEach(i -> {[m
[31m-	    	[m
[31m-	        if (speed.get(i) >= tracks) {[m
[31m-[m
[31m-	        	Optional<String> warCry = Optional.ofNullable(filteredHorse.get(i).getWarCry());[m
[31m-	        	String orElse = warCry.orElse("NO WAR CRY!");[m
[31m-	        	[m
[31m-	        	winner = "\nWINNER!: \n" + filteredHorse.get(i).getName() + " finished the track! \nTraveled " + filteredHorse.get(i).getDistance() + " meters. \n" + orElse +"\n\n"; [m
[31m-	        		[m
[31m-		    } else {[m
[31m-			  [m
[31m-			 	int distanceTraveled = tracks - speed.get(i);[m
[31m-			  	endRace.add(filteredHorse.get(i).getName() + " traveled " + filteredHorse.get(i).getDistance() + " meters. " + distanceTraveled + " meter/s left.");[m
[31m-[m
[31m-		    }[m
[31m-	    });[m
[31m-[m
[31m-	    if (winner != null) {[m
[31m-	    	System.out.println(winner);[m
[31m-	    }[m
[31m-[m
[31m-	    System.out.println("LOOSER!: ");[m
[31m-	    endRace.parallelStream().forEach(System.out::println);[m
[31m-[m
[31m-	}[m
[31m-[m
[31m-	private static List<String> warCry() {[m
[31m-[m
[31m-		List<String> warCries = new ArrayList<>();[m
[31m-[m
[31m-		warCries.add("Remember the Alamo!");[m
[31m-		warCries.add("The Rebel Yell!");[m
[31m-		warCries.add("Greek 'Alala' and 'Eleleu'!");[m
[31m-		warCries.add("There is no land for us beyond the Volga!");[m
[31m-		warCries.add("The Roman Barritus!");[m
[31m-		warCries.add("Deus Hoc Vult!");[m
[31m-		warCries.add("Tenno Heika Banzai!");[m
[31m-		warCries.add("Liberty or Death!");[m
[31m-		warCries.add("Tulta munille!");[m
[31m-		warCries.add("Currahee!");[m
[31m-		warCries.add("Uurah!");[m
[31m-		warCries.add("Deseperta Ferro!");[m
[31m-		warCries.add("Uukhai!");[m
[31m-		warCries.add("Tenno Heika Banzai!");[m
[31m-		warCries.add("The Rebel Yell!");[m
[31m-		warCries.add("Dieu et Mon Droit!");[m
[31m-		warCries.add(null); [m
[31m-		warCries.add(null); [m
[31m-		warCries.add(null); [m
[31m-		return warCries;[m
[31m-[m
[31m-	}[m
[31m-[m
[31m-	private static void countdownTimer() {[m
[31m-		try {[m
[31m-[m
[31m-			System.out.println();[m
[31m-[m
[31m-			for (int x = 3 ; x > 0 ; x--) {[m
[31m-				System.out.println("Race will start in : " + x +"!");[m
[31m-				Thread.sleep(1000);[m
[31m-		 	}[m
[31m-[m
[31m-		 	System.out.println();[m
[31m-[m
[31m-		} catch (InterruptedException e) {[m
[31m-			Thread.currentThread().interrupt();[m
[31m-		}[m
[31m-[m
[31m-	}[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/Horses.class b/Horses.class[m
[1mdeleted file mode 100644[m
[1mindex f5ca3d7..0000000[m
Binary files a/Horses.class and /dev/null differ
[1mdiff --git a/Horses.java b/Horses.java[m
[1mdeleted file mode 100644[m
[1mindex a7b8f82..0000000[m
[1m--- a/Horses.java[m
[1m+++ /dev/null[m
[36m@@ -1,45 +0,0 @@[m
[31m-[m
[31m-[m
[31m-public class Horses {[m
[31m-	[m
[31m-	String name;[m
[31m-	Boolean healthy;[m
[31m-	Integer distanceTraveled;[m
[31m-	String warCry;[m
[31m-	[m
[31m-[m
[31m-	Horses(String name, Boolean healthy, Integer distanceTraveled, String warCry) {[m
[31m-[m
[31m-		this.name = name;[m
[31m-		this.healthy = healthy;[m
[31m-		this.distanceTraveled = distanceTraveled;[m
[31m-		this.warCry = warCry;[m
[31m-		[m
[31m-[m
[31m-	}[m
[31m-[m
[31m-	public String getName() {[m
[31m-		return name.toUpperCase();[m
[31m-	}[m
[31m-[m
[31m-	public Boolean getHealth() {[m
[31m-		return healthy;[m
[31m-	}[m
[31m-[m
[31m-	public Integer getDistance() {[m
[31m-		return distanceTraveled;[m
[31m-	}[m
[31m-[m
[31m-	public String getWarCry() {[m
[31m-		return warCry;[m
[31m-	}[m
[31m-[m
[31m-	public String printHorseList() {[m
[31m-		return "Name ["+name.toUpperCase() + "] " + "Healthy [" + healthy + "] " + "Traveled [" + distanceTraveled + "] " + "WarCry [" + warCry + "]";[m
[31m-	}[m
[31m-[m
[31m-	public String toString() {[m
[31m-		return "Name ["+name + "] " + "Healthy [" + healthy + "] " + "Traveled [" + distanceTraveled + "] " + "WarCry [" + warCry + "]";[m
[31m-	}[m
[31m-[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/UserInput.class b/UserInput.class[m
[1mdeleted file mode 100644[m
[1mindex a221211..0000000[m
Binary files a/UserInput.class and /dev/null differ
[1mdiff --git a/UserInput.java b/UserInput.java[m
[1mdeleted file mode 100644[m
[1mindex c36c557..0000000[m
[1m--- a/UserInput.java[m
[1m+++ /dev/null[m
[36m@@ -1,69 +0,0 @@[m
[31m-import java.util.Scanner;[m
[31m-[m
[31m-public class UserInput {[m
[31m-[m
[31m-	static boolean isNumber;[m
[31m-	static Scanner getInput = new Scanner(System.in);[m
[31m-	static int tracks = 0;[m
[31m-	static int horseCount = 0;[m
[31m-[m
[31m-	static void distanceInput() {[m
[31m-		[m
[31m-		do {[m
[31m-[m
[31m-    		System.out.print("\nEnter Track Distance (Meters) from Start to Finish : ");[m
[31m-[m
[31m-	    	if (getInput.hasNextInt()) {[m
[31m-	    		tracks = getInput.nextInt();[m
[31m-	    		isNumber = true;[m
[31m-	    		[m
[31m-	    	} else {[m
[31m-	    		invalidInput();[m
[31m-	    	}[m
[31m-[m
[31m-	    	if ((tracks > 1000) || (tracks < 1)) {[m
[31m-				System.out.println("Please enter only from 1 - 1000!\n");[m
[31m-		    	isNumber = false;[m
[31m-	    	}[m
[31m-[m
[31m-	    	System.out.print("\nTrack Created with the distace of : " + tracks + " meters.\n");[m
[31m-[m
[31m-    	} while (!(isNumber));[m
[31m-		[m
[31m-	}[m
[31m-[m
[31m-	static void horseInput() {[m
[31m-		[m
[31m-		do {[m
[31m-[m
[31m-    		System.out.print("\nEnter Number of Horses : ");[m
[31m-[m
[31m-	    	if (getInput.hasNextInt()) {[m
[31m-	    		horseCount = getInput.nextInt();[m
[31m-	    		isNumber = true;[m
[31m-[m
[31m-	    	} else {[m
[31m-	    		invalidInput();[m
[31m-	    	}[m
[31m-[m
[31m-	    	if ((horseCount > 100) || (horseCount < 1)) {[m
[31m-				System.out.println("Please enter only from 1 - 100!\n");[m
[31m-		    	isNumber = false;[m
[31m-	    	}[m
[31m-[m
[31m-    	} while (!(isNumber));[m
[31m-	}[m
[31m-[m
[31m-	static void promptEnterKey(){[m
[31m-	   System.out.println("\nPress \"ENTER\" to start the Race...");[m
[31m-	   Scanner scanner = new Scanner(System.in);[m
[31m-	   scanner.nextLine();[m
[31m-	}[m
[31m-[m
[31m-	static void invalidInput() {[m
[31m-	    System.out.println("\nPlease enter a valid number!");[m
[31m-		isNumber = false;[m
[31m-		getInput.next();[m
[31m-	}[m
[31m-[m
[31m-}[m
\ No newline at end of file[m
