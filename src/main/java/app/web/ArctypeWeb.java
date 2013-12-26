package app.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import app.bean.ItemTree;
import app.entity.Arctype;
import app.entity.Authority;
import app.services.ArctypeService;
import app.utils.WebUtils;

import com.love320.zpro.code.bean.Page;
import com.love320.zpro.code.utils.ConvertUtils;

@Controller
@RequestMapping("/arctype")
public class ArctypeWeb implements IWeb<Arctype> {
	
	@Autowired
	private ArctypeService arctypeService;
	
	@Override
	@RequestMapping("/list")
	public String list(Model model, Page<Arctype> page, HttpServletRequest request) {
		//列表
		page = arctypeService.find(page, WebUtils.build(request));
		model.addAttribute("page", page);
		return "arctype/list";
	}

	@Override
	@RequestMapping("/add")
	public String add(Model model) {
		return edit(model,null);
	}

	@Override
	@RequestMapping("/edit/{id}")
	public String edit(Model model,@PathVariable Long id) {
		Arctype entity = new Arctype();
		if(id != null) entity = arctypeService.get(id);
		model.addAttribute("entity", entity);
		return "arctype/input";
	}

	@Override
	@RequestMapping("/save")
	public ModelAndView save(Arctype entity) {
		arctypeService.saveOrUdate(entity);
		return new ModelAndView("redirect:/arctype/list"); 
	}
	
	@RequestMapping("/saveids")
	public ModelAndView saveids(Arctype entity,Long[] ids) {
		ConvertUtils.listByIds("authorityList", entity, ids, Authority.class);
		arctypeService.saveOrUdate(entity);
		return new ModelAndView("redirect:/arctype/list"); 
	}

	@Override
	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable Long id) {
		boolean st = arctypeService.delete(id);
		return new ModelAndView("redirect:/arctype/list"); 
	}
	
	@RequestMapping("/tree")
	public @ResponseBody List<ItemTree> tree(){
		return arctypeService.treeItemList();
	}
	
	@RequestMapping("/json/{id}")
	public @ResponseBody Arctype json(@PathVariable Long id){
		return arctypeService.get(id);
	}

}
