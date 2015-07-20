import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class WSSE {

	private static final String HOST = "jdbc:mysql://localhost:3306/LifeWorks";
	private static final String USER_NAME = "root";
	private static final String PASSWORD = "Skylinemaster123";
	private static final String COMPANY_ANSWER_TABLE = "CompanyAnswerTable";
	private static final String APPLICANT_RESPONSE_TABLE = "ApplicantAnswerTable";
	private static final String APPLICANT_COMPANY_DEVIANCES_TABLE = "ApplicantCompanyDeviancesTable";

	private static final int companyId = 1;

	public static void main(String[] args) {
		WSSE wsse = new WSSE();
		wsse.calculateData();
	}
	
	public void calculateData() {

		try {
			// Setup connection with MySQL Database
			Connection con = DriverManager.getConnection(HOST, USER_NAME,
					PASSWORD);
			Statement stmt = con.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			// SQL for returning a specific company and their responses
			String getCompanyAnswers = "SELECT * FROM " + COMPANY_ANSWER_TABLE
					+ " WHERE id=" + companyId;

			// Retrieve the data from the table
			ResultSet rs = stmt.executeQuery(getCompanyAnswers);
			// Check to make sure your statement has returned a company
			if (!rs.next()) {
				throw new Exception("No companies found matching that ID!");
			}
			// Find the number of Columns returned
			ResultSetMetaData rsmd = rs.getMetaData();
			int columnsNumber = rsmd.getColumnCount();
			double[] companyAnswers = new double[columnsNumber];
			
			// Initialize the array of company answers using the retrieved data
			for (int colNumber = 0; colNumber < columnsNumber; colNumber++) {
				companyAnswers[colNumber] = rs.getDouble(colNumber+1);
			}

			// Close connection to Company table
			rs.close();
			stmt.close();

			// Create connection with the applicant table
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			// SQL statement to retrieve all applicants matching a given company
			String getApplicantAnswers = "SELECT * FROM "
					+ APPLICANT_RESPONSE_TABLE + " " + "WHERE companyId="
					+ companyId;

			// Retrieve results
			rs = stmt.executeQuery(getApplicantAnswers);
			// Check to make sure you received results
			if (!rs.next()) {
				throw new Exception(
						"No applicants found matching that company ID!");
			}
			// Find number of columns in returned data
			rsmd = rs.getMetaData();
			columnsNumber = rsmd.getColumnCount();
			double[] applicantAnswers = new double[columnsNumber];

			// Initialize array to hold applicant responses, then call next
			// method to calculate
			// deviations from the company and applicant responses
			do {
				for (int colNumber = 0; colNumber < columnsNumber; colNumber++) {
					applicantAnswers[colNumber] = rs.getDouble(colNumber+1);
				}
				calculateScores(companyAnswers, applicantAnswers);
			} while (rs.next());

			// Close connection to applicant response table
			rs.close();
			stmt.close();

			// Create connection with Applicant and Company Deviations Table
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			// SQL statement to return the top five applicants
			String getTopFiveApplicants = "SELECT * FROM "
					+ APPLICANT_COMPANY_DEVIANCES_TABLE + " WHERE companyId="
					+ companyId + " ORDER BY WSSE ASC LIMIT 5";

			// Retrieve the data from the table
			rs = stmt.executeQuery(getTopFiveApplicants);
			while (rs.next()) {
				// Print out the top 5 Applicant ID's and WSSE scores
				System.out.println("Applicant ID: " + rs.getDouble("applicantId"));
				System.out.println("Applicant WSSE: " + rs.getDouble("WSSE"));
				System.out.println();
			}

			// Close connection to Applicant and Company Deviations Table
			rs.close();
			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	double calculateDifference(double bS, double eS){
		return Math.pow(bS-eS,2);
	}
	
	void calculateScores(double[] companyAnswers, double[] applicantAnswers) {
		try {
			Connection con = DriverManager.getConnection(HOST, USER_NAME,
					PASSWORD);
			Statement stmt = con.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			
			String getInsertRow = "SELECT * FROM " + APPLICANT_COMPANY_DEVIANCES_TABLE
					+ " WHERE applicantId="+applicantAnswers[0]+" AND companyId="
					+applicantAnswers[1];
			
			ResultSet rs = stmt.executeQuery(getInsertRow);
			
			boolean isEmpty = !rs.next();
			
			if(isEmpty) {
				rs.moveToInsertRow();
			}
			
			rs.updateInt("applicantId", (int)applicantAnswers[0]);
			rs.updateInt("companyId", (int)applicantAnswers[1]);
			
			double totalDiff = 0, calcDiff = 0;
			
			for(int i = 2; i < applicantAnswers.length; i++) {
				rs.updateDouble(i+1, (calcDiff=calculateDifference(companyAnswers[i-1], applicantAnswers[i])));
				totalDiff += calcDiff;
			}
			
			rs.updateDouble("WSSE", totalDiff);
			
			if(isEmpty) {
				rs.insertRow();
			} else {
				rs.updateRow();
			}
			
			
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
