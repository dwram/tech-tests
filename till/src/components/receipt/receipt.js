import React from 'react';
import ReactDOM from 'react-dom';

class Receipt extends React.Component {

    render() {
        const {products, quantities, submittedCost, tax, discountQualify} = this.props
        const calculatedTax = tax * 100 + '%'
        let discountedTotal = 0
        const eligibleForDiscount = submittedCost > discountQualify
        return (
            <div data-testid="receipt" style={{marginBottom: '100px'}}><h3>Current receipt</h3>
                <div>{
                    products.map((product, index) => {
                        if (quantities[index] > 0) {
                            if(eligibleForDiscount) { discountedTotal += product[2] }
                            return <div>{product[0]} {quantities[index]} x £{product[1]} </div>
                        }
                    })
                }
                </div>
                <div>
                    <div>Costs before discount and tax: {submittedCost}</div>
                    <div>Disc: {eligibleForDiscount ? discountedTotal * 100 + '%' : 'Not eligible'}</div>
                    <div>TAX: {calculatedTax}</div>
                    <div>Final cost: £{eligibleForDiscount ? (submittedCost - ((submittedCost * tax) - discountedTotal)).toFixed(2) : (submittedCost - (submittedCost * tax)).toFixed(2) }</div>
                </div>
            </div>
        )
    }
}

export default Receipt;