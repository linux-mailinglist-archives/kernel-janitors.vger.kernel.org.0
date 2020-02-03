Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA2CE1504B5
	for <lists+kernel-janitors@lfdr.de>; Mon,  3 Feb 2020 11:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBCK6a (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 3 Feb 2020 05:58:30 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:48824 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgBCK63 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Feb 2020 05:58:29 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 013ArGda017409;
        Mon, 3 Feb 2020 10:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=4jB1BTa3bjFior7BYTE2lzJTxUJTrhK6nvqj3XoB4i0=;
 b=TIbr1va+SihhX7RlZnhNzAo/mXgew/w5dtYTJGLOWMv9/FxukCeyjswsGvxhG2Ftv7Eu
 3zkDzHdGIQAiTATAXlaNUbuhkfpV1syZshgOr2IO75g6dAivH08BFwXD+6KioBvk24qo
 dK15ikKdkAvgnHfA2nivrhYuo1saQNDg6NoCA5zAWp8/uf0tNIUYy//X4ooqWgo/KRQp
 BJ3RqFvhYOLeqZUiNmCAnRMuhcYMMTaXvzdSngaRXt1XaqtnuMnH7U/c4ZwRhVOBAvdH
 xEUTqgC1D6KX5NVcYhIsqgIKDGJR4Enbp9L7rY1vqUCywDigy8pcxM8Vc5O7CEIix6uK TA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2xw0rty1uj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Feb 2020 10:58:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 013ArXSQ158076;
        Mon, 3 Feb 2020 10:58:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 2xwjv02hr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Feb 2020 10:58:24 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 013AwOi1005833;
        Mon, 3 Feb 2020 10:58:24 GMT
Received: from kili.mountain (/41.210.143.134)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 02:58:23 -0800
Date:   Mon, 3 Feb 2020 13:58:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ggherdovich@suse.cz
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] x86/intel_pstate: Handle runtime turbo
 disablement/enablement in frequency invariance
Message-ID: <20200203105816.4tplbgmyr6wmunou@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=875
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002030083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=938 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002030083
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Giovanni Gherdovich,

The patch 918229cdd5ab: "x86/intel_pstate: Handle runtime turbo
disablement/enablement in frequency invariance" from Jan 22, 2020,
leads to the following static checker warning:

	arch/x86/kernel/smpboot.c:1988 intel_set_max_freq_ratio()
	error: uninitialized symbol 'turbo_freq'.

arch/x86/kernel/smpboot.c
  1964  static bool intel_set_max_freq_ratio(void)
  1965  {
  1966          u64 base_freq, turbo_freq;
  1967  
  1968          if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
  1969                  goto out;
  1970  
  1971          if (x86_match_cpu(has_glm_turbo_ratio_limits) &&
  1972              skx_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
  1973                  goto out;
  1974  
  1975          if (knl_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The last return here should be "false" instead of "true".  Otherwise we
use "turbo_freq" without initializing it.

  1976                  goto out;
  1977  
  1978          if (x86_match_cpu(has_skx_turbo_ratio_limits) &&
  1979              skx_set_max_freq_ratio(&base_freq, &turbo_freq, 4))
  1980                  goto out;
  1981  
  1982          if (core_set_max_freq_ratio(&base_freq, &turbo_freq))
  1983                  goto out;
  1984  
  1985          return false;
  1986  
  1987  out:
  1988          arch_turbo_freq_ratio = div_u64(turbo_freq * SCHED_CAPACITY_SCALE,
  1989                                          base_freq);
  1990          arch_set_max_freq_ratio(turbo_disabled());
  1991          return true;
  1992  }

regards,
dan carpenter
