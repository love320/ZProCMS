package app.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import app.bean.ItemFile;
import app.services.ExplorerService;
import app.utils.AppPath;

@Controller
@RequestMapping("/explorer")
public class ExplorerWeb {
	
	@Autowired
	private ExplorerService explorerService;
	
	@RequestMapping("/viewlist")
	public @ResponseBody List<ItemFile> viewList(@RequestParam(required=false)String path){
		return explorerService.dirFile(AppPath.WebPath()+"..\\view\\", path);
	}
	
	@RequestMapping("/weblist")
	public @ResponseBody List<ItemFile> webList(@RequestParam(required=false)String path){
		return explorerService.dirFile(AppPath.WebPath()+"..\\..\\", path);
	}
	
	@RequestMapping("/upload")
	public @ResponseBody List<ItemFile> uploadList(@RequestParam(required=false)String path){
		return explorerService.dirFile(AppPath.WebPath()+"..\\..\\upload\\", path);
	}

}
