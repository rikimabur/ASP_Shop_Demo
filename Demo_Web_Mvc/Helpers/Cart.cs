using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Demo_Web_Mvc.Helpers
{
    public class Cart
    {
        public List<CartItem> Items { get; set; }
        public Cart()
        {
            this.Items = new List<CartItem>();
        }
        public CartItem Add_cart(int ProID , int Quantity)
        {
            CartItem existedItem = new CartItem();
            existedItem.MASP  = ProID;
            existedItem.Quantity = Quantity;
            return existedItem;
        }
        public void Add(CartItem item)
        {
            var existedItem = this.Items
                .Where(i => i.MASP == item.MASP)
                .FirstOrDefault();
            if(existedItem !=null)
            {
                existedItem.Quantity+= item.Quantity;
            }
            else
            {
                this.Items.Add(item);
            }
            
        }
        public int GetTotal()
        {
            return this.Items.Sum(i => i.Quantity);
        }
        public void RemoveItem(int masp)
        {
            CartItem existedItem = Items
                .Where(p => p.MASP == masp)
                .FirstOrDefault();
            if (existedItem != null)
            {
                this.Items.Remove(existedItem);
            }
        }
        public void UpdateItem(int masp, int quantity)
        {
            CartItem existedItem = Items
                .Where(p => p.MASP == masp)
                .FirstOrDefault();
            if (existedItem != null)
            {
                existedItem.Quantity = quantity;
            }
        }
        public void UpdateItemAll(CartItem t)
        {
            CartItem existedItem = Items
                .Where(p => p.MASP == t.MASP)
                .FirstOrDefault();
            if (existedItem != null)
            {
                existedItem.Quantity = t.Quantity;
            }
        }
    }
    public class CartItem
    {
        public int MASP { get; set; }
        public int Quantity { get; set; }
    }
}