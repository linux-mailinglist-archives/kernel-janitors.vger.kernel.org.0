Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C7D2A24BA
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Nov 2020 07:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgKBGUY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 2 Nov 2020 01:20:24 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50910 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgKBGUY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Nov 2020 01:20:24 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A268vrE057872;
        Mon, 2 Nov 2020 06:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=YpUzUAbo+ahqusJyGJlif8El1dVsdXT5YlE7ilgflu4=;
 b=nGTAJcmuwhM1EDnqrnv6vnkqckGG8jyiUZApWkF3XzDA0pffO4Stjb8WBpv+YjgkFfBq
 lgiSJmdPzaaihKzKf4k1/kRZORKMu7kymzTivNRZMkJQo5J1sZrlzDdmYMbte9EIh3k2
 lqUOa/92j+CzQpY7BWc+NCgDJ2xDxMsSmMqIlZTFwQKHqtfYgrpWKwXyDKlL+8fasYHe
 T9fo5HLSmu5yPuP4/BXtcOyiyVwlWCVlr54E76dLn8eIU7drpDyz7EaQdxGJEbxK/N+K
 ZEVn2bgGdjI5oUbgzTqaUcg65hxoNpnfBsnSV5i9XFJVRGyDBeZy8G7ZAFoSUWJPTnOr xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 34hhw2a7k8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 06:20:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A26AhMe136253;
        Mon, 2 Nov 2020 06:20:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 34hvrmucg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 06:20:20 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A26KJFA020847;
        Mon, 2 Nov 2020 06:20:19 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 01 Nov 2020 22:20:19 -0800
Date:   Mon, 2 Nov 2020 09:20:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Cc:     Alexandru Vasile <lexnv@amazon.com>,
        kernel-janitors@vger.kernel.org
Subject: Re: [bug report] nitro_enclaves: Add logic for setting an enclave
 vCPU
Message-ID: <20201102062013.GC12347@kadam>
References: <20201030113033.GA3251003@mwanda>
 <6ed3d5cb-e49c-677e-80d4-e02ab14b251a@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ed3d5cb-e49c-677e-80d4-e02ab14b251a@amazon.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020051
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 30, 2020 at 05:23:18PM +0200, Paraschiv, Andra-Irina wrote:
> 
> 
> On 30/10/2020 13:30, Dan Carpenter wrote:
> > 
> > Hello Andra Paraschiv,
> > 
> > The patch ff8a4d3e3a99: "nitro_enclaves: Add logic for setting an
> > enclave vCPU" from Sep 21, 2020, leads to the following static
> > checker warning:
> > 
> >          drivers/virt/nitro_enclaves/ne_misc_dev.c:471 ne_donated_cpu()
> >          error: passing untrusted data 'cpu' to 'cpumask_test_cpu()'
> > 
> > drivers/virt/nitro_enclaves/ne_misc_dev.c
> >    1093          switch (cmd) {
> >    1094          case NE_ADD_VCPU: {
> >    1095                  int rc = -EINVAL;
> >    1096                  u32 vcpu_id = 0;
> >    1097
> >    1098                  if (copy_from_user(&vcpu_id, (void __user *)arg, sizeof(vcpu_id)))
> >                                             ^^^^^^^^
> > 
> >    1099                          return -EFAULT;
> >    1100
> >    1101                  mutex_lock(&ne_enclave->enclave_info_mutex);
> >    1102
> >    1103                  if (ne_enclave->state != NE_STATE_INIT) {
> >    1104                          dev_err_ratelimited(ne_misc_dev.this_device,
> >    1105                                              "Enclave is not in init state\n");
> >    1106
> >    1107                          mutex_unlock(&ne_enclave->enclave_info_mutex);
> >    1108
> >    1109                          return -NE_ERR_NOT_IN_INIT_STATE;
> >    1110                  }
> >    1111
> >    1112                  if (vcpu_id >= (ne_enclave->nr_parent_vm_cores *
> >    1113                      ne_enclave->nr_threads_per_core)) {
> > 
> > To prevent a buffer overflow vcpu_id has to be less than "nr_cpu_ids".
> > Is "ne_enclave->nr_parent_vm_cores * ne_enclave->nr_threads_per_core"
> > <= nr_cpu_ids?  If so then it's fine.
> 
> Hi Dan,
> 
> Thanks for reaching out with regard to this reported issue from the static
> analysis.
> 
> "nr_cpu_ids" is used when the number of cores is initialized, so it should
> be fine. Let me know if I miss something and a check has to be added to
> directly compare to "nr_cpu_ids".

Yeah.  That works.  Thanks for taking a look at this.

regards,
dan carpenter

