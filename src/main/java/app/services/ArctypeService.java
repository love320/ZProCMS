package app.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import app.bean.ItemTree;
import app.entity.Arctype;

import com.love320.zpro.code.bean.Page;
import com.love320.zpro.code.services.BaseService;

//用户服务类
@Service
public class ArctypeService extends BaseService<Arctype> {
	
	public Page find(Page page,Map param){
		return super.find(page,param);
	}
	
	public Arctype get(Long id){
		return super.get(id);
	}
	
	public boolean save(Arctype entity) {
		entity = super.add(entity);
		if(entity.getId() != null && entity.getId() > 0){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean update(Arctype entity){
		return super.update(entity);
	}
	
	public boolean delete(Long id){
		Arctype entity = new Arctype();
		entity.setId(id);
		return super.delete(entity);
	}
	
	public boolean saveOrUdate(Arctype entity){
		return super.saveOrUdate(entity);
	}
	
	public List<ItemTree> treeItemList(){
		return treeItemList(new Long("0"));
	}
	
	public List<ItemTree> treeItemList(Long id){
		Map<String,Object> param = new HashMap<String, Object>();
		List<ItemTree> list = new ArrayList<ItemTree>();
		param.put("reid_EQL", id);
		List<Arctype> arctypelist = super.list(param);
		for(Arctype sing : arctypelist){
			ItemTree item = new ItemTree();
			item.setId(sing.getId());
			item.setText(sing.getTypename());
			item.setChildren(treeItemList(sing.getId()));
			list.add(item);
		}
		return list.size() == 0 ? null:list;
	}
	
}
