package com.azshop.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import com.azshop.dao.IBookDAO;
import com.azshop.models.BookModel;

public class BookDAOImpl implements IBookDAO{

	@Override
	public BookModel findbyId(int id) {
		Configuration conf = new Configuration();
        try (Connection connection = ConnectionFactory.createConnection(conf);
             Table table = connection.getTable(TableName.valueOf("fakenames"))) {

            Get get = new Get(Bytes.toBytes(id)); //get theo rowkey;
            BookModel bookmodel = null;
            try {
    			Result result = table.get(get);
    			if(!result.isEmpty()) {
    				bookmodel = new BookModel();
    				bookmodel.setTitle(Bytes.toString(result.getValue(null, null))); // Family - qualifier
//    				movieTO = new MovieTO();
//    				movieTO.setTitle(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_ORIGINAL_TITLE))));
//    				movieTO.setPosterPath(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_POSTER_PATH))));
//    				movieTO.setPopularity(Bytes.toDouble(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_POPULARITY))));				
//    				movieTO.setDate(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_RELEASE_DATE))));				
//    				movieTO.setRunTime(Bytes.toInt(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_RUNTIME))));
//    				
//    				movieTO.setOverview(Bytes.toString(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_OVERVIEW))));
//    				movieTO.setVoteCount(Bytes.toInt(result.getValue(Bytes.toBytes(ConstantsHBase.FAMILY_MOVIE_MOVIE),
//    						Bytes.toBytes(ConstantsHBase.QUALIFIER_MOVIE_VOTE_COUNT))));
//    				movieTO.setId(movieId);
    			}
    		} catch (Exception e) {
    			// TODO: handle exception
    			e.printStackTrace();
    		}
    		return movieTO;

            List<Cell> cells = result.listCells();
            List<BookModel> books = new ArrayList<BookModel>();
            System.out.printf("ROW%s%sCOLUMN+CELL\n", TABS, TABS);
            for (Cell cell : cells) {
            	BookModel model = new BookModel();
            	
            	model.setIsbn(0);
            	
                System.out.printf("%s%scolumn=%s:%s, timestamp=%d, value=%s\n",
                        Bytes.toString(CellUtil.cloneRow(cell)),
                        TABS,
                        Bytes.toString(CellUtil.cloneFamily(cell)),
                        Bytes.toString(CellUtil.cloneQualifier(cell)),
                        cell.getTimestamp(),
                        Bytes.toString(CellUtil.cloneValue(cell)));
            }
        }
	}

}
