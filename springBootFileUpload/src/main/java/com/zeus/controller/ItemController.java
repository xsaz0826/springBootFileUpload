package com.zeus.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zeus.domain.Item;
import com.zeus.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/item")
public class ItemController {

	@Autowired
	private ItemService itemService;

	// application.properties 에서 upload.path에 저장된 값을 주입한다.
	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/createForm")
	public String itemCreateForm(Model model) {
		log.info("/createForm");
		return "item/createForm";
	}

	@PostMapping("/create")
	public String itemCreate(Item item, Model model) throws IOException, Exception {
		log.info("/create item =" + item.toString());
		// 1. 파일업로드 한 것을 가져올 것
		MultipartFile file = item.getPicture();
		// 2. 파일정보를 로그파일에 기록한다.
		log.info("originalName: " + file.getOriginalFilename());
		log.info("size: " + file.getSize());
		log.info("contentType: " + file.getContentType());
		// 3. 파일을 외장하드에 저장할 것
		String createdFileName = uploadFile(file.getOriginalFilename(), file.getBytes());

		// 4. 저장된 새로운 생성된 파일명을 item 도메인에 저장
		item.setUrl(createdFileName);
		// 5. 테이블에 상품 화면 정보를 저장
		int count = itemService.create(item);

		if (count > 0) {
			model.addAttribute("message", "%s 상품 등록을 성공하였습니다.".formatted(file.getOriginalFilename()));
			return "item/success";
		}
		model.addAttribute("message", "%s 상품 등록을 실패하였습니다.".formatted(file.getOriginalFilename()));
		return "item/failed";
	}

	@GetMapping("/list")
	public String itemList(Model model) throws Exception {
		log.info("/itemList");
		List<Item> itemList = this.itemService.list();
		model.addAttribute("itemList", itemList);
		return "item/list";

	}

	@GetMapping("/detail")
	public String itemDetail(Item i, Model model) throws Exception {
		log.info("/detail");
		Item item = itemService.read(i);
		model.addAttribute("item", item);
		return "item/detail";
	}

	//화면을 요청하는 것이 아니고, 데이터를 보내줄 것을 요청 
	@ResponseBody
	@GetMapping("/display")
	public ResponseEntity<byte[]> itemDisplay(Item item) throws Exception {
		log.info("itemDisplay: ");
		//파일을 읽기 위한 스트림
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String url = itemService.getPicture(item);
		log.info("FILE url: " + url);
		try {
			//String url = 88948cc6-e7aa-48b6-93a5-7ac07b96a39f_kitten-1.jpg
			//파일명의 확장자를 가져옴 String formatName = "jpg";
			String formatName = url.substring(url.lastIndexOf(".") + 1);
			//확장자가 jpg라면 MediaType.IMAGE_JPEG
			MediaType mType = getMediaType(formatName);
			//클라이언트 <-> 서버 (header, body)
			HttpHeaders headers = new HttpHeaders();
			//이미지 파일을 imputstream으로 가져옴
			in = new FileInputStream(uploadPath + File.separator + url);
			//이미지 파일 타입이 null이 아니라면, 헤더에 이미지 타입을 저장
			if (mType != null) {
				headers.setContentType(mType);
			}
			//IOUtils.toByteArray(in) : inputstream에 저장된 파일을 byte[] 변환한다.
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	private MediaType getMediaType(String form) {
		String formatName = form.toUpperCase();
		if (formatName != null) {
			if (formatName.equals("JPG")) {
				return MediaType.IMAGE_JPEG;
			}
			if (formatName.equals("GIF")) {
				return MediaType.IMAGE_GIF;
			}
			if (formatName.equals("PNG")) {
				return MediaType.IMAGE_PNG;
			}
		}
		return null;
	}

	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// 절대 중복되지 않는 문자열 생성(bf44e346-d0cd-49b7-b5cd-106fe43af548)
		UUID uid = UUID.randomUUID();
		// bf44e346-d0cd-49b7-b5cd-106fe43af548_채원.jpg
		String createdFileName = uid.toString() + "_" + originalName;
		// new File("D:/upload", "bf44e346-d0cd-49b7-b5cd-106fe43af548_채원.jpg")
		// D:/upload/bf44e346-d0cd-49b7-b5cd-106fe43af548_채원.jpg 내용이 없는 파일명만 생성
		File target = new File(uploadPath, createdFileName);
		// (파일내용이 있는 바이트배열)byte[] fileData를
		// D:/upload/bf44e346-d0cd-49b7-b5cd-106fe43af548_채원.jpg < 여기에 복사
		FileCopyUtils.copy(fileData, target);
		return createdFileName;
	}
}
