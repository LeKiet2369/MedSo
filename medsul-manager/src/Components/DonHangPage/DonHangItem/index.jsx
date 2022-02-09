import React, { Component } from 'react';
import btnEdit from '../../../img/btnEdit.svg';
import btnRePass from '../../../img/password_icon.svg';
import { connect } from 'react-redux';
import { createAction } from '../../../Redux/actions';

class DonHangItem extends Component {
    render() {
        const {dl_HOTEN, dichVu_Id, dl_TINHTRANG, ctd_DONGIA, dl_TONGTIEN} = this.props.item;
        return (
            <tr className="tRow">
                {/* NO */}
                <th>{this.props.index}</th>
                {/* Tên khách hàng */}
                <td>{dl_HOTEN}</td>
                {/* Tên dịch vụ */}
                <td>{dichVu_Id}</td>
                {/* trạng thái */}
                <td className='tdStatus'>{dl_TINHTRANG}</td>
                <td>{ctd_DONGIA}</td>
                <td>{dl_TONGTIEN}</td>
                <td className="d-flex justify-content-center groupBtn">

                    <button className="btnCustom">
                        <img src={btnEdit} alt="btnEdit" />
                    </button>
                </td>
            </tr>
        );
    }
}

export default connect()  (DonHangItem);