import React from 'react';
import ReactDom from "react-dom";

import './App.css';
import data from "./components/data/hipstercofee.json";
import Receipt from "./components/receipt/receipt.js";
import Menu from "./components/menu/menu.js"
import Form from "./components/form/form.js";

const discounts = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.1]

class App extends React.Component {


    convertJSONItems = function() {
        let productList = []
        const products = data[0].prices[0]
        Object.keys(products).map((key, item_index) => {
            let discount = discounts[item_index]
            productList.push([key, products[key], discount])
        })
        return productList
    };

    state = {
        receipt: [],
        quantities: [],
        currentCost: 0,
        submittedCost: 0,
        products: this.convertJSONItems(),
        discount: 0.05,
        discountQualify: 50,
        tax: 0.0864
    }


    onChange = (currentCost) => {
        this.setState({ currentCost })
    }

    onSubmit = (quantities, submittedCost) => {
        this.setState({
            quantities,
            submittedCost,
        })
    }

    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <div className="shop_info">
                        <div data-testid="shop_name" id="shop_name">{data[0].shopName}</div>
                        <div id="shop_sub_info"><div>{data[0].address}</div><div>{data[0].phone}</div></div>
                    </div>
                    <div className="title">Till Receipt</div>
                    <Menu items={ data[0].prices[0] } onSubmit={this.onSubmit} onChange={this.onChange}/>
                    <div>Current costs: { this.state.currentCost.toFixed(2) }</div>
                    <Receipt products={this.state.products}
                             quantities={this.state.quantities}
                             submittedCost={this.state.submittedCost}
                             tax={this.state.tax}
                             discount={this.state.discount}
                             discountQualify={this.state.discountQualify}
                    />
                </header>
            </div>
        );
    }





}

export default App;
