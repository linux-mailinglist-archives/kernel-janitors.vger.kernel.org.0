Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0E858F97F
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Aug 2022 10:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbiHKIsl (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Aug 2022 04:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234588AbiHKIsh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Aug 2022 04:48:37 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADCE915D1;
        Thu, 11 Aug 2022 01:48:36 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B76fFe024681;
        Thu, 11 Aug 2022 08:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EquYfRqGZXmXb9TGWW8WkU2fAx8SbOKXWJBSgXBhUco=;
 b=nju4AjoCPMW3PJ7yH5Z+t5CFAdLlAu+vjeWFOaqPtS26fbAxDLojsyW50SlVnk2KHWGs
 raOaZPzOCsQEZQ90qf4WmYtnWX3eewzsSIP9H+1UC9bX/ZnPers71NiDg+YC5xVyplXl
 rDGBQbE5Hikn/dBA+xQmUe0h+Piwzv4J6Nx9y6i53N4PUF4YZdAKyulJCi6jiG84174C
 rsbcMAckWE7iVhKoWP2bLpuG0wVs2NxqWBu+HCU1QVW62grZHNTY1i0PR0emc2Z/Uz3J
 PprHctda/FFkYp7Ac//Jc1JSiX9rRj+AjJyk4y8/jsPWuyBhGZueoSN54Wf57iuBMTJZ FA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr8wbne-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 08:48:31 +0000
Received: from pps.filterd (NASANPPMTA01.qualcomm.com [127.0.0.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 27B8eoYa015481;
        Thu, 11 Aug 2022 08:48:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by NASANPPMTA01.qualcomm.com (PPS) with ESMTPS id 3hshckrmc3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 08:48:30 +0000
Received: from NASANPPMTA01.qualcomm.com (NASANPPMTA01.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B8mUfW028397;
        Thu, 11 Aug 2022 08:48:30 GMT
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
        by NASANPPMTA01.qualcomm.com (PPS) with ESMTPS id 27B8mU6X028392
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 08:48:30 +0000
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 01:48:29 -0700
Received: from [10.253.34.2] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 11 Aug
 2022 01:48:27 -0700
Message-ID: <458d93ba-ff78-54e7-5639-bee89e61ce19@quicinc.com>
Date:   Thu, 11 Aug 2022 16:48:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] tracing: react to error return from
 traceprobe_parse_event_name()
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220811071734.20700-1-lukas.bulwahn@gmail.com>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <20220811071734.20700-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h0YHKHn3NZGGL2u0vRKBU07J-JfREHBj
X-Proofpoint-ORIG-GUID: h0YHKHn3NZGGL2u0vRKBU07J-JfREHBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_04,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110024
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

thanks,

Acked-by: Linyu Yuan <quic_linyyuan@quicinc.com>


On 8/11/2022 3:17 PM, Lukas Bulwahn wrote:
> The function traceprobe_parse_event_name() may set the first two function
> arguments to a non-null value and still return -EINVAL to indicate an
> unsuccessful completion of the function. Hence, it is not sufficient to
> just check the result of the two function arguments for being not null,
> but the return value also needs to be checked.
>
> Commit 95c104c378dc ("tracing: Auto generate event name when creating a
> group of events") changed the error-return-value checking of the second
> traceprobe_parse_event_name() invocation in __trace_eprobe_create() and
> removed checking the return value to jump to the error handling case.
>
> Reinstate using the return value in the error-return-value checking.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>   kernel/trace/trace_eprobe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
> index 4a0e9d927443..550671985fd1 100644
> --- a/kernel/trace/trace_eprobe.c
> +++ b/kernel/trace/trace_eprobe.c
> @@ -883,7 +883,7 @@ static int __trace_eprobe_create(int argc, const char *argv[])
>   	trace_probe_log_set_index(1);
>   	sys_event = argv[1];
>   	ret = traceprobe_parse_event_name(&sys_event, &sys_name, buf2, 0);
> -	if (!sys_event || !sys_name) {
> +	if (ret || !sys_event || !sys_name) {
>   		trace_probe_log_err(0, NO_EVENT_INFO);
>   		goto parse_error;
>   	}
