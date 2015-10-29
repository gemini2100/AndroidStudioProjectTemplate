package ${packageName};

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;


/**
 * Created by Nicky on 15/10/17
 * How to use:
 */

//private List<${arrayType}> ${arrayType}Array = new ArrayList<${arrayType}>();
//init${arrayType}Array();
//ListView listview = (ListView) findViewById(R.id.myList);
//${adapterClass} adapter = new ${adapterClass}(MainActivity.this,R.layout. ,${arrayType}Array);
//listview.setAdapter(adapter);
//listview.setOnItemClickListener(new AdapterView.OnItemClickListener()
//{
//@Override
//public void onItemClick(AdapterView<?> parent, View view, int position, long id)
//{
//${arrayType} obj = ${arrayType}Array.get(position);
//Toast.makeText(getContext(),obj.getText(),Toast.LENGTH_SHORT).show();
//}
//});
 

 
public class ${adapterClass} extends ArrayAdapter<${arrayType}>
{
    private int subViewResourceId;
    private LayoutInflater li;

    public ${adapterClass}(Context context, int subViewResourceid,List<${arrayType}> objects)
    {
        super(context,subViewResourceid,objects);
        subViewResourceId = subViewResourceid;
        this.li = LayoutInflater.from(context);
    }

    private static class ViewHolder
    {
        //modify  subview
        ImageView exampleImage;
        TextView  exampleTextView;
        Button    exampleButton;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        ViewHolder holder;
        if (convertView == null)
        {
            convertView = li.inflate(subViewResourceId, parent, false);
            holder = new ViewHolder();

            holder.exampleImage  = (ImageView) convertView.findViewById(R.id.example_image);
            holder.exampleTextView = (TextView) convertView.findViewById(R.id.example_text);
            holder.exampleButton = (Button) convertView.findViewById(R.id.example_button);

            convertView.setTag(holder);
        }
        else
        {
            holder = (ViewHolder) convertView.getTag();
        }

        //get value
        final ${arrayType} data =  getItem(position);
        
        //set value
        String dataText = data.getText();
        holder.exampleTextView.setText(dataText);
        holder.exampleButton.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View v)
            {
                remove(data);
                notifyDataSetChanged();
                Toast.makeText(getContext(), "delete!",Toast.LENGTH_SHORT).show();
            }
        });

        return convertView;
    }

}