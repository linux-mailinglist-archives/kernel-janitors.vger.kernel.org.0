Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A9A6BE9DC
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Mar 2023 14:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjCQNMB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Mar 2023 09:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjCQNMA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Mar 2023 09:12:00 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF79E4DBE;
        Fri, 17 Mar 2023 06:11:55 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HCEdXO012947;
        Fri, 17 Mar 2023 13:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=cBajXBLq8/VUEPMwLBL8moIAxIKvDhD2Pdx3nTDmURc=;
 b=H8it6CGTMKUIuTlm1cHMIR5IJcVgem6noQAuIZlWkjT68bXD560MNm5qab2YXGwtoErf
 tvnyK7IH+38hBsnghbfjtgO7baMPwjfDj+rJ1TV9inJkP7gbKaPZoRlKQ27Hm874OsN4
 JViR1jQ6gBib20f9GGILfZRhvT0PKg+JczAu6eL3snEPbagTvdqUYmPCNkLCrvuDm5hS
 KU9P1RMpQDWiLxKgL9sJAf3Q4G4a2wqclHqXE0aAO9/ghn4avYqazyFBRQS/gZA0ZZ6s
 rSzXJl1/6CA2nAHSxp3GqIWFz6DtLkoVoO5C4LaJjMGa8XwNqUn+/JRh+oZssZAGGUXz mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcr1ssg54-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 13:11:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32HCExZS013907;
        Fri, 17 Mar 2023 13:11:38 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pcr1ssg4k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 13:11:38 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32HCmqxg000650;
        Fri, 17 Mar 2023 13:11:37 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
        by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pbs7ytpu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Mar 2023 13:11:37 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
        by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32HDBa9g7930606
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 17 Mar 2023 13:11:36 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 253F158059;
        Fri, 17 Mar 2023 13:11:36 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EF93A5804B;
        Fri, 17 Mar 2023 13:11:35 +0000 (GMT)
Received: from localhost (unknown [9.163.4.251])
        by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Fri, 17 Mar 2023 13:11:35 +0000 (GMT)
From:   Nathan Lynch <nathanl@linux.ibm.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] powerpc/pseries: Fix exception handling in
 pSeries_reconfig_add_node()
In-Reply-To: <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de>
Date:   Fri, 17 Mar 2023 08:11:35 -0500
Message-ID: <871qln8quw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tmrLSXm7zbLrVyypCe7wlAIuSgHwYVvq
X-Proofpoint-GUID: wzHeKmL7981nZweQa5nW4uFjXbeeQ5aJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_08,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=886
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170089
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Markus Elfring <Markus.Elfring@web.de> writes:
>
> The label =E2=80=9Cout_err=E2=80=9D was used to jump to another pointer c=
heck despite of
> the detail in the implementation of the function =E2=80=9CpSeries_reconfi=
g_add_node=E2=80=9D
> that it was determined already that the corresponding variable contained
> a null pointer (because of a failed function call in two cases).
>
> 1. Thus return directly after a call of the function =E2=80=9Ckzalloc=E2=
=80=9D failed.
>
> 2. Use more appropriate labels instead.
>
> 3. Delete a redundant check.
>
> 4. Omit an explicit initialisation for the local variable =E2=80=9Cerr=E2=
=80=9D.
>
> This issue was detected by using the Coccinelle software.

Is there a correctness or safety issue here? The subject uses the word
"fix" but the commit message doesn't seem to identify one.

Can you share how Coccinelle is being invoked and its output?
