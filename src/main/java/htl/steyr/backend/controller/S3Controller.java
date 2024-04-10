package htl.steyr.backend.controller;

import htl.steyr.backend.service.S3Service;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/user/images")
public class S3Controller {

    private final S3Service s3Service;

    public S3Controller(S3Service s3Service) {
        this.s3Service = s3Service;
    }

    @GetMapping
    public String health() {
        return "UP";
    }

    @PostMapping(path = "/upload", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public String uploadFile(@RequestParam("file") MultipartFile file, @RequestParam Long id) throws IOException {
        s3Service.uploadFile(file.getOriginalFilename(), file, id);
        return "File uploaded";
    }

    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) {
        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(new InputStreamResource(s3Service.getFile(fileName).getObjectContent()));
    }

    @DeleteMapping("/delete/{fileName}")
    public String deleteFile(@PathVariable String fileName) {
        s3Service.deleteObject(fileName);
        return "File deleted";
    }
}