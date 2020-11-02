Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA002A258D
	for <lists+kernel-janitors@lfdr.de>; Mon,  2 Nov 2020 08:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgKBHsB (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 2 Nov 2020 02:48:01 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35462 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgKBHsA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Nov 2020 02:48:00 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A27jftv071695;
        Mon, 2 Nov 2020 07:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=vz8hCHmKp54o3A7i1mQ2RhbCJDGqEbfXLyIxWoxqs/c=;
 b=X4MovlASZV8L9YMrgP3X2fORdHKv4WDlxJp93kfDcgmJ6c6AlDwjeje0BmwBEgbhvbXr
 tFCdygDDP7r2pIgiJu1AAipFnU7WX7d6ULAKcSk0ExCpLTekRn/j9KLrp/4wEUmon025
 emZ8qFcHyWbC8mT63iHsRAtJaidUpOmd6v7xK3KiPl1+inogAdseX0fcbEBdKhlHPA+5
 7PewIsU1ad/61I8MQN9HmLRo8Qe2K5Bspa9nLSzuvCwvrBxnxNcOByJyfz2D8+mIwqaW
 L7+9QpcwdTeRU6EWuW4+wizulhvqfju6LLrbVxYdBOTLKGu6rJUBHshafHYbW8qtwSHI zA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 34hhvc2ea5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 07:47:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A27ihor049002;
        Mon, 2 Nov 2020 07:45:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 34hvrmxbbf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 07:45:32 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A27jVPu021860;
        Mon, 2 Nov 2020 07:45:31 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 01 Nov 2020 23:45:29 -0800
Date:   Mon, 2 Nov 2020 10:45:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rostedt@goodmis.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] tracing, synthetic events: Replace buggy strcat() with
 seq_buf operations
Message-ID: <20201102074524.GA4040095@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=841 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=10 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=10
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=858
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020061
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Steven Rostedt (VMware),

The patch 761a8c58db6b: "tracing, synthetic events: Replace buggy
strcat() with seq_buf operations" from Oct 23, 2020, leads to the
following static checker warning:

	kernel/trace/trace_events_synth.c:703 parse_synth_field()
	warn: passing zero to 'ERR_PTR'

kernel/trace/trace_events_synth.c
   582  static struct synth_field *parse_synth_field(int argc, const char **argv,
   583                                               int *consumed)
   584  {
   585          struct synth_field *field;
   586          const char *prefix = NULL, *field_type = argv[0], *field_name, *array;
   587          int len, ret = 0;
   588          struct seq_buf s;
   589          ssize_t size;
   590  
   591          if (field_type[0] == ';')
   592                  field_type++;
   593  
   594          if (!strcmp(field_type, "unsigned")) {
   595                  if (argc < 3) {
   596                          synth_err(SYNTH_ERR_INCOMPLETE_TYPE, errpos(field_type));
   597                          return ERR_PTR(-EINVAL);
   598                  }
   599                  prefix = "unsigned ";
   600                  field_type = argv[1];
   601                  field_name = argv[2];
   602                  *consumed = 3;
   603          } else {
   604                  field_name = argv[1];
   605                  *consumed = 2;
   606          }
   607  
   608          field = kzalloc(sizeof(*field), GFP_KERNEL);
   609          if (!field)
   610                  return ERR_PTR(-ENOMEM);
   611  
   612          len = strlen(field_name);
   613          array = strchr(field_name, '[');
   614          if (array)
   615                  len -= strlen(array);
   616          else if (field_name[len - 1] == ';')
   617                  len--;
   618  
   619          field->name = kmemdup_nul(field_name, len, GFP_KERNEL);
   620          if (!field->name) {
   621                  ret = -ENOMEM;
   622                  goto free;
   623          }
   624          if (!is_good_name(field->name)) {
   625                  synth_err(SYNTH_ERR_BAD_NAME, errpos(field_name));
   626                  ret = -EINVAL;
   627                  goto free;
   628          }
   629  
   630          if (field_type[0] == ';')
   631                  field_type++;
   632          len = strlen(field_type) + 1;
   633  
   634          if (array)
   635                  len += strlen(array);
   636  
   637          if (prefix)
   638                  len += strlen(prefix);
   639  
   640          field->type = kzalloc(len, GFP_KERNEL);
   641          if (!field->type) {
   642                  ret = -ENOMEM;
   643                  goto free;
   644          }
   645          seq_buf_init(&s, field->type, len);
   646          if (prefix)
   647                  seq_buf_puts(&s, prefix);
   648          seq_buf_puts(&s, field_type);
   649          if (array) {
   650                  seq_buf_puts(&s, array);
   651                  if (s.buffer[s.len - 1] == ';')
   652                          s.len--;
   653          }
   654          if (WARN_ON_ONCE(!seq_buf_buffer_left(&s)))
   655                  goto free;

This was originally reported by kbuild-bot, but it was somehow
overlooked so now it's on my system.  The missing error code will lead
to a NULL dereference in the caller.

   656          s.buffer[s.len] = '\0';
   657  
   658          size = synth_field_size(field->type);
   659          if (size < 0) {
   660                  synth_err(SYNTH_ERR_INVALID_TYPE, errpos(field_type));
   661                  ret = -EINVAL;
   662                  goto free;
   663          } else if (size == 0) {
   664                  if (synth_field_is_string(field->type)) {
   665                          char *type;
   666  
   667                          len = sizeof("__data_loc ") + strlen(field->type) + 1;
   668                          type = kzalloc(len, GFP_KERNEL);
   669                          if (!type) {
   670                                  ret = -ENOMEM;
   671                                  goto free;
   672                          }
   673  
   674                          seq_buf_init(&s, type, len);
   675                          seq_buf_puts(&s, "__data_loc ");
   676                          seq_buf_puts(&s, field->type);
   677  
   678                          if (WARN_ON_ONCE(!seq_buf_buffer_left(&s)))
   679                                  goto free;

Here as well.

   680                          s.buffer[s.len] = '\0';
   681  
   682                          kfree(field->type);
   683                          field->type = type;
   684  
   685                          field->is_dynamic = true;
   686                          size = sizeof(u64);
   687                  } else {
   688                          synth_err(SYNTH_ERR_INVALID_TYPE, errpos(field_type));
   689                          ret = -EINVAL;
   690                          goto free;
   691                  }
   692          }
   693          field->size = size;
   694  
   695          if (synth_field_is_string(field->type))
   696                  field->is_string = true;
   697  
   698          field->is_signed = synth_field_signed(field->type);
   699   out:
   700          return field;
   701   free:
   702          free_synth_field(field);
   703          field = ERR_PTR(ret);
   704          goto out;
   705  }

regards,
dan carpenter
