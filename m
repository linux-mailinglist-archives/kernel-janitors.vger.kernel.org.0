Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A53920060A
	for <lists+kernel-janitors@lfdr.de>; Fri, 19 Jun 2020 12:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732229AbgFSKJV (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 19 Jun 2020 06:09:21 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:34666 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729718AbgFSKJV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Jun 2020 06:09:21 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05JA7XtP072142;
        Fri, 19 Jun 2020 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=gJp/zVp1iIJDeHI3ZYXDJlHWERykBC5oD0NO5dNRWvM=;
 b=aaX1LbpNeJBanHneInWco//eA+vtCTUEaX/SNPnqUFdj6+2rWTQTLPOUKLrRXGxYjXRx
 eIF5JUrUMoFZgx85qJXh14jlEfZoHaszn6vRmOG5URhUOBOF+qmKGbJtWgEC2UGrZPJV
 mHQARyelwWqDKpnMDNQlxSvG3mSsi4z4JHM4qW6BLIm2QnMXHaRg8cLomXXMuTvyhlpi
 fEtCCmVbNKlzyvPZoi8Iw+vJ2EaW2MFHSpL7Jtb/vNULycM1HqzJlZorDBTF9fnsqjqG
 dEL3RM4QxrMUwPmzt88HkPOUDfupJR8SZF75TBiOwKKRaGFhH6Udn9qiKV4VJ128TWO6 +Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 31qg35by09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 19 Jun 2020 10:09:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05JA7q82054018;
        Fri, 19 Jun 2020 10:09:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 31q662g3gq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Jun 2020 10:09:16 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05JA9F9r008952;
        Fri, 19 Jun 2020 10:09:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 19 Jun 2020 03:09:12 -0700
Date:   Fri, 19 Jun 2020 13:09:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     idosch@mellanox.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] mlxsw: spectrum: Adjust headroom buffers for 8x ports
Message-ID: <20200619100907.GA246319@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9656 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=720 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006190074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9656 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 cotscore=-2147483648 lowpriorityscore=0 mlxlogscore=722 spamscore=0
 suspectscore=3 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190074
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ido Schimmel,

The patch 60833d54d56c: "mlxsw: spectrum: Adjust headroom buffers for
8x ports" from Jun 16, 2020, leads to the following static checker
warning:

	drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c:785 mlxsw_sp_span_port_buffer_update()
	warn: passing casted pointer '&buffsize' to 'mlxsw_sp_port_headroom_8x_adjust()' 32 vs 16.

drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
   769  static int
   770  mlxsw_sp_span_port_buffer_update(struct mlxsw_sp_port *mlxsw_sp_port, u16 mtu)
   771  {
   772          struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port->mlxsw_sp;
   773          char sbib_pl[MLXSW_REG_SBIB_LEN];
   774          u32 buffsize;
                ^^^^^^^^^^^^

   775          u32 speed;
   776          int err;
   777  
   778          err = mlxsw_sp_port_speed_get(mlxsw_sp_port, &speed);
   779          if (err)
   780                  return err;
   781          if (speed == SPEED_UNKNOWN)
   782                  speed = 0;
   783  
   784          buffsize = mlxsw_sp_span_buffsize_get(mlxsw_sp, speed, mtu);
   785          mlxsw_sp_port_headroom_8x_adjust(mlxsw_sp_port, (u16 *) &buffsize);
                                                                ^^^^^^^^^^^^^^^^^
This will work if 1) we are on a littel endian system and 2) "buffsize"
is less than USHRT_MAX / 2 but it's super ugly...  :/

   786          mlxsw_reg_sbib_pack(sbib_pl, mlxsw_sp_port->local_port, buffsize);
   787          return mlxsw_reg_write(mlxsw_sp->core, MLXSW_REG(sbib), sbib_pl);
   788  }

regards,
dan carpenter
