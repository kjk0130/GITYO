package imageboard.dao;

import java.util.List;
import java.util.Map;

import imageboard.bean.ImageboardDTO;

public interface ImageboardDAO {

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageboardList(Map<String, String> map);

	public int getTotalA();

	public void imageboardDelete(List<Integer> list);

	public ImageboardDTO getImageboard(int parseInt);

}
