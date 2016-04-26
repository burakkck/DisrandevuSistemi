
import java.util.Calendar;      //Calendar için
import javax.swing.JOptionPane; //showMessageDialog için
 
public class ornek {
 
    public static void main(String[] args) {
        String[] Aylar = {"", "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
            "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"};
        
        String [] Gunler = {"","Pazar","Pazartesi","Salı","Çarşamba","Perşembe","Cuma","Cumartesi"};
 
        /* Calendar yazdığınız anda sol tarafta uyarı çıkacak uyarıya tıklayın
        ve java.util.Calendar'ı projenize ekleyin */
        Calendar takvim = Calendar.getInstance();
 
        /* Tarihi al */
        int bugununTarihi = takvim.get(Calendar.DATE);
 
        /* Tarihi ekrana yaz */
        //System.out.println("Bugün : " + takvim.get(Calendar.DATE));
 
        /* Tarihi değiştir, bir gün geri al */
        //takvim.set(Calendar.DATE, bugununTarihi - 1);
       // System.out.println("Dün   : " + takvim.get(Calendar.DATE));
         
        /* Tarihi bugüne tekrar geri al */
        //takvim.set(Calendar.DATE, bugununTarihi);
 
        /* Tarihi string mesaj olarak ayarla */
        String tarih = takvim.get(Calendar.DATE) + "." + takvim.get(Calendar.YEAR) + "." + Gunler[takvim.get(Calendar.DAY_OF_WEEK)];
 
        /* showMassageDialog olaran ekrana bugünün tarihini yazdır */
        JOptionPane.showMessageDialog(null, tarih, "Bugünün Tarihi",
                JOptionPane.INFORMATION_MESSAGE);
    }
}