Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E89F21865C
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Jul 2020 13:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728805AbgGHLqE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Jul 2020 07:46:04 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:32960 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbgGHLqE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Jul 2020 07:46:04 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 068BfjMD145564;
        Wed, 8 Jul 2020 11:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5XkFjIgTpJ4155rhjuPZYLfybDjJ6oOIFc7ZBjPRC8U=;
 b=btEJTTBgcdq0ERahsvg94RTk9AUXZ9MQXCicqo3Jb6Rc0bP7mnRa+KkO6AT3s0Hq2FVJ
 1FZLn+xnkLDWzLy24HSHNyRcHZ2T+rym1a6p2TXu0ypfknT3EZNM1dfLa/MmrR6GdUDa
 /+bsW/lp9uKwJ7GMLy0WjaUi+bdvK81kbShTt4WvOwfTMT1z+skpIw5Yd+8Cy8fB3yKY
 JIzXuRbG4EayFvT7PeA7SLXPU2eMXyIkU2C7Uog7evSWiymAE+Rs3+DZLeB6DoIkocp7
 uL+YFuCB5kSr58zLb7JkioJnCDOaQyETKPOw/WhQprvEx66E0Y+82Y+RieGw+4kh2Oq0 tQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 323wacp1av-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 08 Jul 2020 11:45:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 068BhD3d007410;
        Wed, 8 Jul 2020 11:45:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 325bgjneb1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 08 Jul 2020 11:45:01 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 068Bj0bM020066;
        Wed, 8 Jul 2020 11:45:00 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 08 Jul 2020 04:45:00 -0700
Date:   Wed, 8 Jul 2020 14:44:53 +0300
From:   <dan.carpenter@oracle.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] cpufreq: intel_pstate: Allow raw energy performance
 preference value
Message-ID: <20200708114453.GA11282@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=3 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9675 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 cotscore=-2147483648
 suspectscore=3 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007080085
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Srinivas Pandruvada,

The patch f473bf398bf1: "cpufreq: intel_pstate: Allow raw energy
performance preference value" from Jun 26, 2020, leads to the
following static checker warning:

	drivers/cpufreq/intel_pstate.c:731 store_energy_performance_preference()
	error: uninitialized symbol 'epp'.

drivers/cpufreq/intel_pstate.c
   706  static ssize_t store_energy_performance_preference(
   707                  struct cpufreq_policy *policy, const char *buf, size_t count)
   708  {
   709          struct cpudata *cpu_data = all_cpu_data[policy->cpu];
   710          char str_preference[21];
   711          bool raw = false;
   712          u32 epp;
                    ^^^
   713          int ret;
   714  
   715          ret = sscanf(buf, "%20s", str_preference);
   716          if (ret != 1)
   717                  return -EINVAL;
   718  
   719          ret = match_string(energy_perf_strings, -1, str_preference);
   720          if (ret < 0) {
   721                  if (!boot_cpu_has(X86_FEATURE_HWP_EPP))
   722                          return ret;
   723  
   724                  ret = kstrtouint(buf, 10, &epp);
                                                  ^^^^

   725                  if (ret)
   726                          return ret;
   727  
   728                  raw = true;
   729          }
   730  
   731          ret = intel_pstate_set_energy_pref_index(cpu_data, ret, raw, epp);
                                                                             ^^^
This will cause a KASan warning at runtime as well as a static checker
warning.

   732          if (ret)
   733                  return ret;
   734  
   735          return count;
   736  }

regards,
dan carpenter
