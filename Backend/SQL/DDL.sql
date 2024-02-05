CREATE TABLE cvm.perfil_mensal_fi (
    CNPJ_FUNDO TEXT NULL,
    DENOM_SOCIAL TEXT NULL,
    DT_COMPTC TEXT NULL,
    VERSAO TEXT NULL,
    NR_COTST_PF_PB TEXT NULL,
    NR_COTST_PF_VAREJO TEXT NULL,
    NR_COTST_PJ_NAO_FINANC_PB TEXT NULL,
    NR_COTST_PJ_NAO_FINANC_VAREJO TEXT NULL,
    NR_COTST_BANCO TEXT NULL,
    NR_COTST_CORRETORA_DISTRIB TEXT NULL,
    NR_COTST_PJ_FINANC TEXT NULL,
    NR_COTST_INVNR TEXT NULL,
    NR_COTST_EAPC TEXT NULL,
    NR_COTST_EFPC TEXT NULL,
    NR_COTST_RPPS TEXT NULL,
    NR_COTST_SEGUR TEXT NULL,
    NR_COTST_CAPITALIZ TEXT NULL,
    NR_COTST_FI_CLUBE TEXT NULL,
    NR_COTST_DISTRIB TEXT NULL,
    NR_COTST_OUTRO TEXT NULL,
    PR_PL_COTST_PF_PB TEXT NULL,
    PR_PL_COTST_PF_VAREJO TEXT NULL,
    PR_PL_COTST_PJ_NAO_FINANC_PB TEXT NULL,
    PR_PL_COTST_PJ_NAO_FINANC_VAREJO TEXT NULL,
    PR_PL_COTST_BANCO TEXT NULL,
    PR_PL_COTST_CORRETORA_DISTRIB TEXT NULL,
    PR_PL_COTST_PJ_FINANC TEXT NULL,
    PR_PL_COTST_INVNR TEXT NULL,
    PR_PL_COTST_EAPC TEXT NULL,
    PR_PL_COTST_EFPC TEXT NULL,
    PR_PL_COTST_RPPS TEXT NULL,
    PR_PL_COTST_SEGUR TEXT NULL,
    PR_PL_COTST_CAPITALIZ TEXT NULL,
    PR_PL_COTST_FI_CLUBE TEXT NULL,
    PR_PL_COTST_DISTRIB TEXT NULL,
    PR_PL_COTST_OUTRO TEXT NULL,
    VOTO_ADMIN_ASSEMB TEXT NULL,
    JUSTIF_VOTO_ADMIN_ASSEMB TEXT NULL,
    PR_VAR_CARTEIRA TEXT NULL,
    MOD_VAR TEXT NULL,
    PRAZO_CARTEIRA_TITULO TEXT NULL,
    DELIB_ASSEMB TEXT NULL,
    VL_CONTRATO_COMPRA_DOLAR TEXT NULL,
    VL_CONTRATO_VENDA_DOLAR TEXT NULL,
    PR_VARIACAO_DIARIA_COTA TEXT NULL,
    FPR TEXT NULL,
    CENARIO_FPR_IBOVESPA TEXT NULL,
    CENARIO_FPR_JUROS TEXT NULL,
    CENARIO_FPR_CUPOM TEXT NULL,
    CENARIO_FPR_DOLAR TEXT NULL,
    CENARIO_FPR_OUTRO TEXT NULL,
    PR_VARIACAO_DIARIA_COTA_ESTRESSE TEXT NULL,
    PR_VARIACAO_DIARIA_PL_TAXA_ANUAL TEXT NULL,
    PR_VARIACAO_DIARIA_PL_TAXA_CAMBIO TEXT NULL,
    PR_VARIACAO_DIARIA_PL_IBOVESPA TEXT NULL,
    FATOR_RISCO_OUTRO TEXT NULL,
    PR_VARIACAO_DIARIA_OUTRO TEXT NULL,
    PR_COLATERAL_DERIV TEXT NULL,
    FATOR_RISCO_NOCIONAL TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_LONG_IBOVESPA TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_LONG_JUROS TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_LONG_CUPOM TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_LONG_DOLAR TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_LONG_OUTRO TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_SHORT_IBOVESPA TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_SHORT_JUROS TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_SHORT_CUPOM TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_SHORT_DOLAR TEXT NULL,
    VL_FATOR_RISCO_NOCIONAL_SHORT_OUTRO TEXT NULL,
    PF_PJ_COMITENTE_1 TEXT NULL,
    CPF_CNPJ_COMITENTE_1 TEXT NULL,
    COMITENTE_LIGADO_1 TEXT NULL,
    PR_COMITENTE_1 TEXT NULL,
    PF_PJ_COMITENTE_2 TEXT NULL,
    CPF_CNPJ_COMITENTE_2 TEXT NULL,
    COMITENTE_LIGADO_2 TEXT NULL,
    PR_COMITENTE_2 TEXT NULL,
    PF_PJ_COMITENTE_3 TEXT NULL,
    CPF_CNPJ_COMITENTE_3 TEXT NULL,
    COMITENTE_LIGADO_3 TEXT NULL,
    PR_COMITENTE_3 TEXT NULL,
    PR_ATIVO_EMISSOR_LIGADO TEXT NULL,
    PF_PJ_EMISSOR_1 TEXT NULL,
    CPF_CNPJ_EMISSOR_1 TEXT NULL,
    EMISSOR_LIGADO_1 TEXT NULL,
    PR_EMISSOR_1 TEXT NULL,
    PF_PJ_EMISSOR_2 TEXT NULL,
    CPF_CNPJ_EMISSOR_2 TEXT NULL,
    EMISSOR_LIGADO_2 TEXT NULL,
    PR_EMISSOR_2 TEXT NULL,
    PF_PJ_EMISSOR_3 TEXT NULL,
    CPF_CNPJ_EMISSOR_3 TEXT NULL,
    EMISSOR_LIGADO_3 TEXT NULL,
    PR_EMISSOR_3 TEXT NULL,
    PR_ATIVO_CRED_PRIV TEXT NULL,
    VEDAC_TAXA_PERFM TEXT NULL,
    DT_COTA_TAXA_PERFM TEXT NULL,
    VL_COTA_TAXA_PERFM TEXT NULL,
    VL_DIREITO_DISTRIB TEXT NULL,
    NR_COTST_ENTID_PREVID_COMPL TEXT NULL,
    PR_COTST_ENTID_PREVID_COMPL TEXT NULL,
    PR_PATRIM_LIQ_MAIOR_COTST TEXT NULL,
    NR_DIA_CINQU_PERC TEXT NULL,
    NR_DIA_CEM_PERC TEXT NULL,
    ST_LIQDEZ TEXT NULL,
    PR_PATRIM_LIQ_CONVTD_CAIXA TEXT NULL
);

CREATE INDEX idx_perfil_mensal_fi_denom_social_dt_comptc
ON cvm.perfil_mensal_fi_202301 (denom_social, dt_comptc);



CREATE OR REPLACE FUNCTION cvm.get_perfil_mensal_fi_piores(
	p_denom_social text,
	p_dt_comptc text)
    RETURNS TABLE(denom_social text, dt_comptc text, pr_variacao_diaria_pl_ibovespa numeric, pr_variacao_diaria_pl_taxa_anual numeric) 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    RETURN QUERY
    SELECT
        a.denom_social,
        a.dt_comptc,
        a.pr_variacao_diaria_pl_ibovespa,
        a.pr_variacao_diaria_pl_taxa_anual
    FROM
        cvm.perfil_mensal_fi_ok a
    WHERE
        a.denom_social ILIKE '%' || p_denom_social || '%'  AND
		a.dt_comptc = p_dt_comptc and
		a.pr_variacao_diaria_pl_taxa_anual <>0
	order by 
		a.pr_variacao_diaria_pl_taxa_anual asc
	LIMIT 20;
END;
$BODY$;


CREATE OR REPLACE FUNCTION cvm.get_perfil_mensal_fi_melhores(
	p_denom_social text,
	p_dt_comptc text)
    RETURNS TABLE(denom_social text, dt_comptc text, pr_variacao_diaria_pl_ibovespa numeric, pr_variacao_diaria_pl_taxa_anual numeric) 
    LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
    RETURN QUERY
    SELECT
        a.denom_social,
        a.dt_comptc,
        a.pr_variacao_diaria_pl_ibovespa,
        a.pr_variacao_diaria_pl_taxa_anual
    FROM
        cvm.perfil_mensal_fi_ok a
    WHERE
        a.denom_social ILIKE '%' || p_denom_social || '%'  AND
		a.dt_comptc = p_dt_comptc and
		a.pr_variacao_diaria_pl_taxa_anual <>0
	order by 
		a.pr_variacao_diaria_pl_taxa_anual desc
	LIMIT 20;
END;
$BODY$;
CREATE OR REPLACE FUNCTION cvm.get_perfil_mensal_fi(
	p_denom_social text,
	p_dt_comptc text)
    RETURNS TABLE(denom_social text, dt_comptc text, pr_variacao_diaria_pl_ibovespa numeric, pr_variacao_diaria_pl_taxa_anual numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN
    RETURN QUERY
    SELECT
        a.denom_social,
        a.dt_comptc,
        a.pr_variacao_diaria_pl_ibovespa,
        a.pr_variacao_diaria_pl_taxa_anual
    FROM
        cvm.perfil_mensal_fi_ok a
    WHERE
        a.denom_social ILIKE '%' || p_denom_social || '%'  AND
		a.dt_comptc = p_dt_comptc and
		a.pr_variacao_diaria_pl_taxa_anual <>0;
END;
$BODY$;

