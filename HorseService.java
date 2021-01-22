import java.util.List;
import java.util.ArrayList;

public interface HorseService {

	void createHorses(int tracks);
	void filterHorses();
	void validateHorses();
	List<Integer> raceStart(int tracks);
	void raceEnd(int tracks, List<Integer> speed);
	
	List<Horses> horseList = new ArrayList<>();
	List<Horses> filteredHorse = new ArrayList<>();
}