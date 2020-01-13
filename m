Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537031391C3
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jan 2020 14:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgAMNGa (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Jan 2020 08:06:30 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:52472 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMNGa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jan 2020 08:06:30 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DD2u0w075613;
        Mon, 13 Jan 2020 13:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=X3UonPiagZ3iS7v/6gRl57sh7wtvQXOCdDIqvbUEHu0=;
 b=LK4MSVQChRWDVqVzxvZhAXWT7sx8Zj0Ih+JKSPfSfsEbE9yq9qaMZvWU16Kng2rGkDGZ
 BipqVAMGRzB7JHZt5b9LCUTFcv2qht2K8bfud785HqcgO7wkppNoSVpBPwWFJpRpeEEh
 vK4/0TyEhf6C/meOY10P2C+p0k+zVH8kdTIx/C6S0ia//J5M1ZWq9WRVGMYq7Joyfffz
 z0+y3GSYlxLcaISc64zBIe3/YwYujn02MTnmJi3TIWkucS77RrCUJDLPC7kEfzUW/JWa
 8SBvUQaGoaeg2vybLo5R6uYJYDoTq3jMcd/HZg/zLnEdUsRDTjQ8vOgynXbxt4yB9KUJ dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xf73y6syp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jan 2020 13:06:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00DD437Q127551;
        Mon, 13 Jan 2020 13:06:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2xfqvr3w44-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jan 2020 13:06:26 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00DD6QOH014193;
        Mon, 13 Jan 2020 13:06:26 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 05:06:25 -0800
Date:   Mon, 13 Jan 2020 16:06:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kafai@fb.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS
Message-ID: <20200113130617.7ecdrglwlmofhvrx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=331
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001130109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9498 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=396 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001130109
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Martin KaFai Lau,

The patch 85d33df357b6: "bpf: Introduce BPF_MAP_TYPE_STRUCT_OPS" from
Jan 8, 2020, leads to the following static checker warning:

	kernel/bpf/bpf_struct_ops.c:501 bpf_struct_ops_map_seq_show_elem()
	warn: 'value' is an error pointer or valid

kernel/bpf/bpf_struct_ops.c
   495  static void bpf_struct_ops_map_seq_show_elem(struct bpf_map *map, void *key,
   496                                               struct seq_file *m)
   497  {
   498          void *value;
   499  
   500          value = bpf_struct_ops_map_lookup_elem(map, key);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is just a dummy function that only returns -EINVAL.

   501          if (!value)
   502                  return;
   503  
   504          btf_type_seq_show(btf_vmlinux, map->btf_vmlinux_value_type_id,
   505                            value, m);
   506          seq_puts(m, "\n");
   507  }


regards,
dan carpenter
