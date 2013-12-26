package app.services;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import app.bean.ItemFile;


/**
 * 文件管理器
 * @author Administrator
 *
 */
@Service
public class ExplorerService {
	
	/**
	 * 获取指定文件夹下文件和目录
	 * @param root 根目录
	 * @param path 相对路径
	 * @return
	 */
	public List<ItemFile> dirFile(String root,String path){
		List<ItemFile> list = new ArrayList<ItemFile>();
		String dirpath = root + path;
		File dir = new File(dirpath);
		if(dir.isDirectory()){
			for(String sing : dir.list()){
				ItemFile item = new ItemFile();
				item.setRoot(root);
				item.setPath(path);
				
				File temFile = new File(dirpath+sing);
				item.setId(temFile.hashCode());
				item.setIsdir(temFile.isDirectory());
				item.setName(temFile.getName());
				item.setAllpath(temFile.getPath());
				item.setSize(temFile.length());
				list.add(item);
			}
		}
		return list.size() == 0 ? null :list;
	}
	
}
