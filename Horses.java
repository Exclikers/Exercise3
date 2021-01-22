

public class Horses {
	
	String name;
	Boolean healthy;
	Integer distanceTraveled;
	String warCry;
	

	Horses(String name, Boolean healthy, Integer distanceTraveled, String warCry) {

		this.name = name;
		this.healthy = healthy;
		this.distanceTraveled = distanceTraveled;
		this.warCry = warCry;
		

	}

	public String getName() {
		return name.toUpperCase();
	}

	public Boolean getHealth() {
		return healthy;
	}

	public Integer getDistance() {
		return distanceTraveled;
	}

	public String getWarCry() {
		return warCry;
	}

	public String printHorseList() {
		return "Name ["+name.toUpperCase() + "] " + "Healthy [" + healthy + "] " + "Traveled [" + distanceTraveled + "] " + "WarCry [" + warCry + "]";
	}

	public String toString() {
		return "Name ["+name + "] " + "Healthy [" + healthy + "] " + "Traveled [" + distanceTraveled + "] " + "WarCry [" + warCry + "]";
	}

}