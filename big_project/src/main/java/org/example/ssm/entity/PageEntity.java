package org.example.ssm.entity;

public class PageEntity {
    private Integer currentPage;
    private Integer startPage;
    private Integer pageSize;

    public Integer getCurrentPage() {
        if (currentPage == null) {
            currentPage = 1;
        }
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public int getStartPage() {
        if (startPage == null) {
            startPage = 0;
        }
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getPageSize() {
        if (pageSize == null) {
            pageSize = 10;
        }
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

}