import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Jsoup {

	public static void main(String[] args) throws IOException {
		
		Jsoup selTest = new Jsoup();
        selTest.crawl();
        storeDataToCsv();
	}


	// WebDriver
	public WebDriver driver;
	
	//properties
	public static final String Web_Driver_id = "webdriver.chrome.driver";
	public static final String Web_Driver_Path = "C:\\JavaTPC\\sw\\chromedriver_win32\\chromedriver.exe";
	
	 //ũ�Ѹ� �� URL
    private String base_url;
    
    static List<ArrayList> csv_row = new ArrayList<>();
    static ArrayList<String> row;
    
    public Jsoup() {
    	super();
    	
    	System.setProperty(Web_Driver_id, Web_Driver_Path);
    	
    	this.driver = new ChromeDriver();
    	base_url = "https://finding.eseoul.go.kr/admin/find_list.jsp";
    }
    
    public void crawl() {
    	
    	   try {
               //get page (= ���������� url�� �ּ�â�� ���� �� request �� �Ͱ� ����)
               driver.get(base_url);
               
               String source = driver.getPageSource();
				
               WebElement pages = driver.findElement(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[3]/tbody/tr[3]/td/table/tbody/tr[2]/td/span"));
               List<WebElement> a_tags = pages.findElements(By.className("gray"));	
               
               for(int j = 0; j < 25; j++) {
					for(int i = 0; i < 9; i++) {
				
						System.out.println("i => " + i);
						
						tableRowsCrawl();
						// ������ index�� �ִ� a �±׸� ����
						List<WebElement> web = driver.findElement(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[3]/tbody/tr[3]/td/table/tbody/tr[2]/td/span")).findElements(By.className("gray"));
						web.get(i).click();
						
						Thread.sleep(200);
					}
					// ����¡�� ����ϴ� ������ ��ü a �±� ���� -> ��ü a �±׵� �� ������ a�±״� ���� ������ ��ũ
					List<WebElement> web = driver.findElements(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[3]/tbody/tr[3]/td/table/tbody/tr[2]/td/span/a"));
					web.get(web.size() - 1).click();
					System.out.println("=================");
               }

           } catch (Exception e) {
               e.printStackTrace();
           } 
    }
    
	// table -> tr Ŭ�� �޼���
	public void tableRowsCrawl() {

		try {
			
			// ���̺� row�� ���ϱ�
			WebElement web = driver.findElement(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[2]"));
			List<WebElement> trList = web.findElements(By.xpath("tbody/tr"));
			final int ROWS = trList.size();
			
			for(int i = 0; i < ROWS; i++) {
				
				// �Խñ� ��ȣ ����
				WebElement id = driver.findElement(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[2]/tbody/tr[" + (i + 1) + "]/td[1]/span"));
				String code = id.getText();
				
				// �Խù� �󼼺��� Ŭ��
				WebElement anchor = driver.findElement(By.xpath("/html/body/form[2]/table/tbody/tr[5]/td/table[2]/tbody/tr["+ (i + 1) +"]/td[4]/span/a"));
				anchor.click();
				Thread.sleep(2000);
				
				// ���빰 ũ�Ѹ�
				contentCrawl(code);
				
				csv_row.add(row);
				
				// �ڷΰ���
				driver.navigate().back();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void contentCrawl(String code) {
		
		// //*[@id="cate_box"]/tbody
		WebElement web = driver.findElement(By.xpath("//*[@id=\"cate_box\"]/tbody"));
		List<WebElement> list = driver.findElements(By.xpath("//*[@id=\"cate_box\"]/tbody/tr"));
		
		System.out.println(code);
		row = new ArrayList<>();
		row.add(code);
		
		for(int i = 0; i < list.size(); i++) {
			
			//System.out.println(list.get(i).findElement(By.tagName("td")).getText());
			String td = list.get(i).findElement(By.tagName("td")).getText();
			td = td.replace(",", ".");
			td = td.replace("\n", " ");
			System.out.println(td);
			
			row.add(td);
		}
		System.out.println(row);
	}
	
	public static void storeDataToCsv() throws IOException {
		
		BufferedWriter bufWriter = null;
		String path = "C:\\Users\\gutenLee\\Desktop\\seoul";
		String title = "seoulLost";
				
		try {
			bufWriter = new BufferedWriter(new FileWriter(path + "/" + title + ".csv", true));
			
			for(ArrayList elem : csv_row) {
				

				System.out.println(elem);
				String collect = (String) elem.stream().collect(Collectors.joining(","));
				
				bufWriter.write(collect);
				bufWriter.newLine();
				
			}
			bufWriter.flush();
			bufWriter.close();
		}
		catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			
		}
	}
}
